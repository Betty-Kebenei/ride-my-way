FactoryBot.define do
  factory :ride do
    ride_type 'offer'
    origin 'ET'
    destination 'Amity'
    take_off  '2019-06-18 11:07:00'
    number_of_people 2
    association :user, factory: :user

    factory :ride_with_user do
      transient do
        email { "user@andela.com" }
      end
    end
  end
end