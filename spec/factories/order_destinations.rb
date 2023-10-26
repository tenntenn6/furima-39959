FactoryBot.define do
  factory :order_destination do
    

    post_code          {'123-4567'}
    prefecture_id      {'5'}
    cities             {'南国市'}
    street_address     {'11-1'}
    building           {'メゾンハイツ'}
    telephone          {Faker::PhoneNumber.cell_phone}
    order_id           {'1'}

    
  end
end
