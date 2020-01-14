require 'rails_helper'

RSpec.describe EventsController, type: :controller do
  
  describe "events#index action" do
    it "should successfully show the page" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "events#edit action" do
    it "shouldn't let unauthenticated users edit and event" do
      event = FactoryBot.create(:event)
      get :edit, params: { id: event.id }
      expect(response).to redirect_to new_user_session_path
    end
  end

  describe "events#update action" do
    it "shouldn't let unauthenticated users update an event" do
      event = FactoryBot.create(:event)
      patch :update, params: { id: event.id, event: { vaccine_type: 'Rabies', date: Date.today, notes: 'test note'}}
      expect(response).to redirect_to new_user_session_path
    end
  end

  describe "events#destroy action" do
    it "shouldn't let unauthenticated users destroy an event" do
      event = FactoryBot.create(:event)
      delete :destroy, params: { id: event.id }
      expect(response).to redirect_to new_user_session_path
    end
  end

end
