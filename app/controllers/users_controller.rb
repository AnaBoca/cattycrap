class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @events = @user.events.order('created_at DESC').paginate(page: params[:page], per_page: 10)
  end

end
