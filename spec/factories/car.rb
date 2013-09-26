FactoryGirl.define do
  factory :car do
    year 1990
    make "honda"
    sequence(:model) { |n| "civic #{n}"}
    list_price 25000
    user
  end
end
