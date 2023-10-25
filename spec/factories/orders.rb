FactoryBot.define do
  factory :order do
    association :user
    association :item
    association :destination
    

    post_code          {'123-4567'}
    prefecture_id      {'5'}
    cities             {'南国市'}
    street_address     {'11-1'}
    telephone          {'080-5454-4662'}
    order_id           {'1'}
    
  end
end
