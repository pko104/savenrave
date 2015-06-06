class TicketsController < ApplicationController
  def ticket
    @new_ticket = Ticket.new
  end
end
