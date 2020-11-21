class EventsController < ApplicationController
  before_action :set_event, only: %i[show]

  def index
    @event = Event.new
    @events = Event.actual
  end

  def show
    @events = Event.all
    @event = Event.find(params[:id])
    @comment = Comment.new
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to event_path(@event)
    else
      render :new
    end
  end

  private

  def event_params
    params.require(:event).permit(:name, :date, :description, :email)
  end

  def set_event
    @event = Event.find(params[:id])
  end
end
