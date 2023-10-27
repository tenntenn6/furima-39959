FactoryBot.define do
  factory :order_destination do
    

    post_code          {'123-4567'}
    prefecture_id      {'5'}
    cities             {'南国市'}
    street_address     {'11-1'}
    building           {'メゾンハイツ'}
    telephone          {'09056655665'}
    token              {'1234123'}

    
  end
end
