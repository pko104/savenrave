class EventsController < ApplicationController
  def create
    @new_event.save
  end
end
