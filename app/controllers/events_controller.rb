class EventsController < ApplicationController
  before_action :set_event, only: %i[show edit update]

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(params[:event])
    @event.save
    redirect_to event_path(@event)
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    @event.update(params[:event])
    redirect_to event_path(@event)
  end

  private

  def event_params
    params.require(:event).permit(:name, :date, :description, :email)
  end

  def set_event
    @event = Event.find(params[:id])
  end
end
