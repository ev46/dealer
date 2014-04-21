# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :store do
    address "MyString"
    sun "MyString"
    mon "MyString"
    tus "MyString"
    wed "MyString"
    thr "MyString"
    fri "MyString"
    sat "MyString"
    about "MyText"
    time_zone "MyString"
    phone 1
    email "MyString"
    fax 1
    url "MyString"
  end
end
