class RoomUser < ApplicationRecord
  belongs_to :user
  belongs_to :room




  # after_create_commit -> { broadcast_replace_to "testebroadcast" }
  # quando um registro de Room(o nome do model) é criado, ele chama esse after_create_commit que pega basicamente toda view que tem:   <%= turbo_stream_from "testebroadcast" %>
  # , e atualiza sem precisar dar o f5. Por exemplo, adicionou algo no banco de dados, se a view tem   <%= turbo_stream_from "testebroadcast" %>
  # nao precisa dar o f5
end
