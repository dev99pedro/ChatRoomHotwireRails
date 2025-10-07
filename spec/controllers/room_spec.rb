require "rails_helper"

RSpec.describe RoomsController, type: :request do
  include Warden::Test::Helpers

  let(:user) { create(:user) }

  before do
    login_as(user, scope: :user)
  end

  describe "Get #Index" do 
    it "should return all Rooms" do
      Room.new(name: "Room teste").save
      
      get '/rooms'
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /rooms" do
  it "creates a room" do
    post "/rooms", params: {
      room: {
        name: "Sala de Teste"
      }
    }

    # Verifica se a sala foi criada
    expect(Room.count).to eq(1)
    room = Room.last
    expect(room.name).to eq("Sala de Teste")
   end
  end


  describe "GET /rooms/:id (show)" do
    let!(:room1){create(:room)} 
    let!(:chat1) { create(:chat, user: user, room: room1) }
    it "should check if there is a user with a chat associate in a room" do
      get "/rooms/#{room1.id}"
      expect(response).to have_http_status(200)

      expect(room1.users).to include(user)
      expect(room1.chats).to include(chat1)
    end
  end


  describe "Delete /rooms/:id" do 
    let!(:room1){create(:room)} 
    it "should destroy the room" do
      delete "/rooms/#{room1.id}"

      expect(response).to have_http_status(302)
      expect(Room.exists?(room1.id)).to be_falsey
    end
  end





end