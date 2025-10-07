class Chat < ApplicationRecord
  belongs_to :user
  belongs_to :room

  validates :content, presence: true, length: {minimum: 1}  




  after_create_commit do 
    broadcast_append_to "updatechat",
    target: "updatechat"
  end
  # depois de criar um chat novo no banco de dados. atualiza sem atualizar a página onde tem <%= turbo_stream_from "updatechat" %> no id updatechat

  
  
end
