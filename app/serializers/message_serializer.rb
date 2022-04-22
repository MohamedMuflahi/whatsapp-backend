class MessageSerializer
  include FastJsonapi::ObjectSerializer
  attributes :user_id, :room_id, :content
  has_one :user
end
