class EventsController < ApplicationController
  def create
    @new_event = Event.new(event_params)
    if @new_event.save
      redirect_to @new_event, notice: "new_event"
    else
      render :new
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:name, :location, :date, :time)
  end
end
