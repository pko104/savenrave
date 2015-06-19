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

  def network
    @user = User.find(params[:id])
    @current_user = current_user
    if @current_user.network_id == nil
      @network = Network.new(user_id: @current_user.id)
      @network.connected_ids_array = ""
      @network.save
      @current_user.network_id = @network.id
      @current_user.save
      @messages = Message.where(user_id: @user)
    else
      @newsfeed = []
      @networks = Network.where(user_id: @user)
      if @networks.length >= 1 && @networks != nil
        @networks.each do |network|
          network.messages.each do |nw|
            @newsfeed << nw
          end
          if network.connected_ids_array != nil && network.connected_ids_array.length >= 1
          friends = network.connected_ids_array.split(',')
            friends.each do |friend|
              @friend_network = Network.where(user_id: friend)
              if @friend_network.length >= 1 && @friend_network != nil
                @friend_network.each do |f|
                  f.messages.each do |p|
                    @newsfeed << p
                  end
                end
              end
            end
          end
        end
      end
    end

  def event_params
    params.require(:event).permit(:name, :location, :date, :time)
  end
end
