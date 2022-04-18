class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :username, :online
  attribute :rooms do |user|
    user.rooms.uniq
  end
end
