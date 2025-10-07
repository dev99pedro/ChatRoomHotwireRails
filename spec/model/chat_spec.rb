require 'rails_helper'

RSpec.describe Chat, type: :model do
  include ActiveJob::TestHelper
  include Warden::Test::Helpers

  let(:user) { create(:user) }
  let!(:room1) {create(:room)}

  before do
    login_as(user, scope: :user)
  end

  describe "broadcasting" do 
   it "broadcasts to updatechat after create" do
      perform_enqueued_jobs do
        expect { Chat.create!(content: "Olá", user: user, room: room1) }.to have_broadcasted_to("updatechat") 
      end

    end
  end


    describe "validations" do

    it "is valid with all attributes" do
      chat = Chat.new(content: "Olá", user: user, room: room1)
      expect(chat).to be_valid
    end
  end


end