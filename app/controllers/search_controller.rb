class SearchController < ApplicationController
  def search
    if params[:q]
      if params[:q] == ""
        @events = []
        redirect_to "/search", notice: "You must input a character"
      else
        @events = Event.where("name ILIKE ?", "%#{params[:q]}%")
      end
    end
  end

end
