FactoryBot.define do
  factory :item do
    association :user

    name              {'鰹のたたき'}
    explanation       {Faker::Lorem.paragraph_by_chars(number: 1000)}
    status_id         {'2'}
    category_id       {'2'}
    prefecture_id     {'3'}
    burden_id         {'2'}
    shipping_date_id  {'2'}
    price             {Faker::Commerce.price(range: 300..9999999)}
    

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end

    

    
  end
end

