class RoomsController < ApplicationController
    def index
        @room = Room.new
        @current_user = current_user
        redirect_to '/signin' unless @current_user
        @rooms = Room.public_rooms
        @users = User.all_except(@current_user)
    end

    def create
        @room = Room.create(name: params["room"]["name"])
    end

    def show
       
        @single_room = Room.find_by(id: params[:id])
        @message = Message.new
        @messages = @single_room.messages

        @current_user = current_user
        # @single_room = Room.find(params[:id])
        @rooms = Room.public_rooms
        @users = User.all_except(@current_user)
        @room = Room.new
      
        render "index"
    end
end
