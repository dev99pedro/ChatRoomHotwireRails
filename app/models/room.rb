class Room < ApplicationRecord
  has_many :users
  has_many :chats
  has_many :room_users

  validates :name, presence: true, length: {minimum: 3}


  

end
