class ApplicationController < ActionController::API
    # include ActionController::Cookies
    def secret_key
        'random_key'
    end

    def encode(payload)
        JWT.encode(payload, secret_key, 'HS256')
    end

    def decode(token)
        JWT.decode(token, secret_key, true, { algorithm: 'HS256'})[0]
    end
    def create
        user = User.find_by(username: params[:username])
        if user && user.authenticate(params[:password])
            # session[:user_id] = user.id
            payload = {'user_id': user.id}
            token = encode(payload)
            render json: {
                user: UserSerializer.new(user),
                token: token,
                authenticated: true,
                user_rooms: RoomSerializer.new(user.rooms)
            }
        else 
            render json: {
                message: 'This username/password combination cannot be found',
                authenticated: false
            }
        end
    end
end
