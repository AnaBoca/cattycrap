class EventsController < ApplicationController

  def index
    @events = Event.all.order("date").paginate(page: params[:page], per_page: 10)
  end

  def new
    @event = Event.new
  end

  def create
    Event.create(event_params)
    redirect_to root_path
  end

  private

  def event_params
    params.require(:event).permit(:vaccine_type, :date, :notes)
  end

end
