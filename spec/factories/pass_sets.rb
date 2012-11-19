# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :pass_set do
    bar nil
    date "2012-11-11"
    total_released_passes 1
    sold_passes 1
    unsold_passes 1
    price "9.99"
  end
end
