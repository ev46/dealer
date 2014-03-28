# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :offer do
    email "MyString"
    amount 1
    respond false
    car_id 1
  end
end
