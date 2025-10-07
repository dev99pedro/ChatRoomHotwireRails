FactoryBot.define do
  factory :chat do 
    content {"Mensagem"}
    association :user
    association :room
  end
end