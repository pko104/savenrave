class EventsController < ApplicationController

  def index
    @new_ticket = Ticket.new
  end

end
