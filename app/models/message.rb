class Message < ActiveRecord::Base
  belongs_to :user
  attr_accessible :text, :to_user_id
  belongs_to :to_user, class_name: "User"
  validates :user_id, :text, :to_user_id, presence: true
  validates :text, length: {maximum: 140}
  validates :to_user_id, uniqueness: {scope: :user_id}
end
