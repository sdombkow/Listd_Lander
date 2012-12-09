# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :pass do
    Pass_Set nil
    Purchase nil
    name ""
    redeemed false
  end
end
