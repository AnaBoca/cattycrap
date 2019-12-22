class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @events = Event.all.order("created_at DESC").paginate(page: params[:page], per_page: 10)
  end

  def new
    @event = Event.new
  end

  def create
    current_user.events.create(event_params)
    redirect_to root_path
  end

  def show
    @event = Event.find(params[:id])
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    @event.update_attributes(event_params)
    redirect_to root_path
  end

  private

  def event_params
    params.require(:event).permit(:vaccine_type, :date, :notes)
  end

end
