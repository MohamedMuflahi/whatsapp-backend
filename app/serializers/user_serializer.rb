class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :username
  attribute :rooms do |user|
    user.rooms.uniq
  end
end
