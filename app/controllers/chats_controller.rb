class ChatsController < ApplicationController
    def create
        user = User.find_by(username: params[:username])
        chat = Chat.create(user_id: user.id,room_id: params[:room_id])
        room = Room.find(params[:room_id])
        if room
            puts "successfully saved a message!"
            RoomsChannel.broadcast_to(room, {
                room: RoomSerializer.new(room),
                users: UserSerializer.new(room.users),
                messages:  room.messages
            })
            render json: room
        end
        
    end
    def leave
        room = Room.find(params[:room_id])
        chat = Chat.find_by(user_id: params[:user_id],room_id: room.id)
        if chat
            # puts chat
            Chat.delete(chat.id)
            RoomsChannel.broadcast_to(room, {
                room: room,
                users: UserSerializer.new(room.users),
                messages: room.messages
            })
            render json: chat
        end
        puts chat
    end
end
