FactoryBot.define do
  factory :buyer_shopping_address do
    postal_code { '111-1111' }
    prefecture { '2' }
    city { '市' }
    address { '番地' }
    building { 'ビル' }
    phone_number { '09011112222' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
