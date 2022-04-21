class AppearanceChannel < ApplicationCable::Channel
  def subscribed
    # @user = User.find_by(id: params[:user])
    # stream_for @user
  end

  def unsubscribed
    # ActionCable.server.broadcast "appearance_channel", user_id: current_user.id, status: 'offline'
  end
  # def appear
  #   ActionCable.server.broadcast "appearance_channel", user_id: current_user.id, status: 'online'
  # end
end
