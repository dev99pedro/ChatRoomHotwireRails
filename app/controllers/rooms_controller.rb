class RoomsController < ApplicationController
   include ActionView::RecordIdentifier
  def index
    @rooms = Room.all
  end


  def create 
    @room = Room.new(room_params)

    if @room.save
      redirect_to rooms_path, notice: "created"
    else 
      render :new, notices: "fail to create room"
    end

  end




  # precisar fazer o @rooma aparcer aqui no show
  def show
   
    @room = Room.find(params[:id])
    user = current_user
    @room.users << user

    Turbo::StreamsChannel.broadcast_update_to "updateusername",
    target: dom_id(@room),
    partial: "rooms/room",
    locals: { room: @room }
    
    others_rooms = Room.where.not(id: @room.id)
    if others_rooms
      others_rooms.each do | room | 
        room.users.delete(user) 
        Turbo::StreamsChannel.broadcast_replace_later_to "updatecountuser",  # Atualiza a contagem de usuários na sala
        target: dom_id(room, :index),
        partial: "rooms/countuser",
        locals: { room: room }
      end
    end

    Turbo::StreamsChannel.broadcast_replace_to "updatecountuser", 
    target: dom_id(@room, :index), 
    partial: "rooms/countuser", 
    locals: { room: @room }

  

    

    render layout: false if turbo_frame_request?
    # basicamente ta dizendo que se tem um turbo frame sendo chamado na def show, não é pra renderizar o layout normal. No caso ele vai renderizar só o que o turbo-frame chama. 


    @chat = Chat.new


   
    # essa aqui é uma maneira de ativar o turbo sem precisar que o banco de dados seja alterado
    # diferente do after_create_commit -> { broadcast_replace_to "updateusername" }
    # tu chama <%= turbo_stream_from "updateusername" %> na view em que tu quer ativar isso
    # locals: é o valor que esta sendo passado para o <%= render 'room', room: @room %>
    # partials: é qual partial tu vai ativar com isso



   



    
  end



  def new
    @room = Room.new
  end


  def destroy
    @room = Room.find(params[:id])
    Turbo::StreamsChannel.broadcast_replace_later_to "updatecountuser",
    target: dom_id(@room, :index),
    # colocar um :index ali, faz botar um index na antes do id, para nao ficar igual ao updateusername e dar bug. No caso ficaria assim o id da div "index_room_31"
    partial: "rooms/countuser",
    locals: {room: @room}



    @user = current_user
    @room.users.delete(@user)
    Turbo::StreamsChannel.broadcast_remove_to "updateusername",
    target: dom_id(@user),
    partial: "rooms/room",
    locals: { room: @room }
    redirect_to rooms_path, notice: "destroy"

  end

  private


  def room_params
    params.require(:room).permit(:name)
  end
  
end
