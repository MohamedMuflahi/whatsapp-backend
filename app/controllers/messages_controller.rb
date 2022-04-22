class MessagesController < ApplicationController
    def index
        messages = Message.all
        render json: messages
    end

    def create
        message = Message.new(message_params)
        room = Room.find(message_params["room_id"])
        if message.save
            puts "successfully saved a message!"
            RoomsChannel.broadcast_to(room, {
                room: RoomSerializer.new(room),
                users: UserSerializer.new(room.users),
                messages: room.messages
            })
        end
        render json: MessageSerializer.new(message)
    end

    private

    def message_params
        params.require(:message).permit(:content, :user_id, :room_id, :sender_name)
    end
end
