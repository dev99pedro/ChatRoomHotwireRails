class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :login, presence: true, uniqueness: true

  has_many :posts 
  has_many :comments
  has_many :likes

  

  
  has_many :chats
  belongs_to :room, optional: true
end
