FactoryBot.define do
  factory :order_address do
    zip { '123-4567' }
    state_id { 4 }
    city  { '東京都' }
    addressline1 { '1-1' }
    addressline2 { 'home' }
    tell { '1234567890' }
    token {"tok_abcdefghijk00000000000000000"}
    
  end
end
