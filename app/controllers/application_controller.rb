class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :nav_bar

  def nav_bar
    @new_ticket = Ticket.new
    @new_event = Event.new
    if params[:q]
      search
    end
  end

  def search
    if params[:q]
      if params[:q] == ""
        redirect_to "/search", notice: "You must input a character"
      else
        @events = Event.where("name ILIKE ?", "%#{params[:q]}%")
        redirect_to search_path(:q => params[:q])
      end
    end
  end

end
