class Chat < ApplicationRecord
  belongs_to :user
  belongs_to :room


  after_create_commit do 
    broadcast_append_to "updatechat",
    target: "updatechat"
  end
  
  
end
