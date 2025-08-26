class ChatsController < ApplicationController
   include ActionView::RecordIdentifier
  # isso aqui faz vc conseguir usar o dom_id ali no Turbo.StreamsChannel
  def create
    @room = Room.find(params[:room_id])
    @chat = @room.chats.build(chat_params)
    @chat.user_id = current_user.id
    @chat.save
  end




  private


  def chat_params
    params.require(:chat).permit(:content)
  end
end
