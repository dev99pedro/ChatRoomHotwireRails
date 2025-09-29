class RoomUser < ApplicationRecord
  belongs_to :user
  belongs_to :room




  # after_destroy_commit :broadcast_user_count

  private

  # def broadcast_user_count
  #   Turbo::StreamsChannel.broadcast_replace_to(
  #     "updatecountuser",
  #     target: dom_id(room),
  #     partial: "rooms/user_count",
  #     locals: { room: room }
  #   )
  # end

 


  # quando um registro de Room(o nome do model) é criado, ele chama esse after_create_commit que pega basicamente toda view que tem:   <%= turbo_stream_from "testebroadcast" %>
  # , e atualiza sem precisar dar o f5. Por exemplo, adicionou algo no banco de dados, se a view tem   <%= turbo_stream_from "testebroadcast" %>
  # nao precisa dar o f5
end
