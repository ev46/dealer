# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :car do
    two_door false
    year 1
    make "MyString"
    model "MyString"
    vin "MyString"
    price 1
    warranty "MyString"
  end
end
