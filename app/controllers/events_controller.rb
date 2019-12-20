class EventsController < ApplicationController

  def index
    @events = Event.all.order("date").paginate(page: params[:page], per_page: 10)
  end

end
