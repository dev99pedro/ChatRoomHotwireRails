class Post < ApplicationRecord
  validates_presence_of :title, :description
  has_many :comments, dependent: :destroy
  belongs_to :user
  has_many :likes
end
