class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
    @events = Event.all.order("created_at DESC").paginate(page: params[:page], per_page: 10)
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.create(event_params)
    if @event.valid?
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @event = Event.find(params[:id])
    pets = petfinder.find_pets('dog')
  end

  def edit
    @event = Event.find(params[:id])

    if @event.user != current_user
      return render plain: 'Not Allowed', status: :forbidden
    end
  end

  def update
    @event = Event.find(params[:id])
    
    if @event.user != current_user
      return render plain: 'Not Allowed', status: :forbidden
    end

    @event.update_attributes(event_params)
    if @event.valid?
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @event = Event.find(params[:id])
    if @event.user != current_user
      return render plain: 'Not Allowed', status: :forbidden
    end

    @event.destroy
    redirect_to root_path
  end

  private

  def event_params
    params.require(:event).permit(:vaccine_type, :date, :notes)
  end

end
