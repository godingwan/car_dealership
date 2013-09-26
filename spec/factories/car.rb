FactoryGirl.define do
  factory :car do
    year 1990
    sequence(:make) { |n| "honda #{n}"}
    sequence(:model) { |n| "civic #{n}"}
    list_price 25000
    user
  end
end
