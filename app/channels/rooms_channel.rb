class RoomsChannel < ApplicationCable::Channel
  def subscribed
    @room = Room.find_by(id: params[:room])
    @user = User.find_by(id: params[:user])
    stream_for @room
    appear
  end
  def appear
    @user.update(online: "online")
    RoomsChannel.broadcast_to(@room, {
      room: RoomSerializer.new(@room),
      users: UserSerializer.new(@room.users),
      messages: @room.messages
  })
  end
  def disappear
    @user.update(online: "offline")
    RoomsChannel.broadcast_to(@room, {
      room: RoomSerializer.new(@room),
      users: UserSerializer.new(@room.users),
      messages: @room.messages
  })
  end
  def unsubscribed
    disappear
  end
end
