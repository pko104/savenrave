class TicketsController < ApplicationController

  def create
    @event = Event.find(params[:id])
    @new_ticket = Ticket.new(ticket_params)
    @new_ticket.event_id == @event.id

    if current_user.id
      @new_ticket.user_id == current_user.id
    else
      @new_ticket.user_id == 1
    end

    if @new_ticket.save
      redirect_to @event, notice: "new_event"
    else
      render :new
    end
  end

  def ticket_params
    params.require(:ticket).permit(:postdate, :enddate, :price)
  end


end
