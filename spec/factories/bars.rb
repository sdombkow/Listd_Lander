# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :bar do
    name "MyString"
    phone_number 1
    address "MyString"
    intro_paragraph "MyText"
  end
end
