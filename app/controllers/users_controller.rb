class UsersController < ApplicationController

    def index
        users = User.all
        render json: UserSerializer.new(users)
    end
    
    def create
        user = User.create!(user_params)
        if user
            room = Room.create(name: user.username, description: "This is your space.")
            chat = Chat.create(user_id: user.id,room_id: room.id)
            message = Message.create(content: "This is your space. Draft messages or list your to-dos. You can also talk to yourself here, but please bear in mind you’ll have to supply both sides of the conversation.",room_id:room.id,user_id: user.id)
            payload = {'user_id': user.id}
            token = encode(payload)
            render json: {
                user: UserSerializer.new(user),
                token: token,
                authenticated: true
            }
        else 
            render json: { message: 'There was an error creating your account' }
        end
    end

  def show
    token = request.headers['Authentication'].split(' ')[1]
    payload = decode(token)
    user = User.find(payload['user_id'])
    if user
      render json: UserSerializer.new(user)
    else
      render json: { message: 'Error', authenticated: false }
    end
  end

  def update
    # user = User.find(params[:id])
    # user.update(online: params[:online]);
    # ActionCable.server.broadcast 'appearance_channel', json_response(user)
  end

  private

  def user_params
    params.permit(:username, :password)
  end
end
