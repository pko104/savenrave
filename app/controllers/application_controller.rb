class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :nav_bar

  def nav_bar
    @new_ticket = Ticket.new

    if params[:q]
      if params[:q] == ""
        redirect_to "/search", notice: "You must input a character"
      else
        @event = params[:q]
        redirect_to "/search", action: "search", q: @event
      end
    end
  end

end
