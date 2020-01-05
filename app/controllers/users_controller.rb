class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @events = Event.paginate(page: params[:page], per_page: 10)
  end

end
