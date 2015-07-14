class TicketsController < ApplicationController

  def create
    @new_ticket = Ticket.new(ticket_params)
 #   if current_user.id
 #     @new_ticket.user_id == current_user.id
 #   else
      @new_ticket.user_id = 1
 #   end

    if @new_ticket.save
      redirect_to @new_ticket.event, notice: "new_event"
    else
      render :new
    end
  end

  def ticket_params
    params.require(:ticket).permit(:postdate, :enddate, :price, :event_id)
  end

end
