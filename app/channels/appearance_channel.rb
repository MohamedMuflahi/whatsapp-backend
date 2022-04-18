class AppearanceChannel < ApplicationCable::Channel
  def subscribed
    current_user = User.find(params[:user_id]);
    stream_from "appearance_channel"

    if current_user

      ActionCable.server.broadcast "appearance_channel", { user: current_user.id, online: :on }

      current_user.online = "online"

      current_user.save!

    end


  end

  def unsubscribed

    if current_user

      # Any cleanup needed when channel is unsubscribed
      ActionCable.server.broadcast "appearance_channel", { user: current_user.id, online: :off }

      current_user.online = "offline"

      current_user.save!      

    end


  end 

end
end
