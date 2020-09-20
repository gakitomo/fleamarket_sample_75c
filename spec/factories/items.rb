FactoryBot.define do
  factory :item do
    name {"abe"}
    description {'test'}
    condition_id {'2'}
    shipping_burden_id {'2'}
    shipping_method_id {'1'}
    shipping_area_id {'3'}
    category_id {'4'}
    shipping_data {'2'}
    price{'2'}
    association :category, factory: :category
  end
end 