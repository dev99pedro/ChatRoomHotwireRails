class RoomsController < ApplicationController
   include ActionView::RecordIdentifier
  def index
    @rooms = Room.all
  end


  # precisar fazer o @rooma aparcer aqui no show
  def show
    @room = Room.find(params[:id])
    users = current_user
    @chat = Chat.new

    @room.users << users

    Turbo::StreamsChannel.broadcast_replace_later_to "updateusername",
      target: dom_id(@room),
      partial: "rooms/room",
      locals: { room: @room }
    # essa aqui é uma maneira de ativar o turbo sem precisar que o banco de dados seja alterado
    # diferente do after_create_commit -> { broadcast_replace_to "updateusername" }
    # tu chama <%= turbo_stream_from "updateusername" %> na view em que tu quer ativar isso
    # locals: é o valor que esta sendo passado para o <%= render 'room', room: @room %>
    # partials: é qual partial tu vai ativar com isso
  end


  def destroy
    @room = Room.find(params[:id])
    user = current_user
    @room.users.delete(user)
    @user = current_user

    Turbo::StreamsChannel.broadcast_remove_to "updateusername",
      target: dom_id(@user),
      partial: "rooms/room",
      locals: { room: @room }

    redirect_to rooms_path, notice: "destroy"
  end
end
