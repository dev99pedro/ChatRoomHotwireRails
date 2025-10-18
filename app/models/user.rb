class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :login, presence: true, uniqueness: true




  
  has_many :chats, dependent: :destroy
  belongs_to :room, optional: true
end
