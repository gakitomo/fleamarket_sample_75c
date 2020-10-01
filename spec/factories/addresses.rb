FactoryBot.define do
  factory :address do
    address_first_name      {"田中"}
    address_last_name       {"田中"}
    address_first_name_kana {"たなか"}
    address_last_name_kana  {"たなか"}
    address_number          {"333-3333"}
    address_prefecture      {"大阪府"}
    address_name            {"大阪市"}
    address_block           {"北区１丁目１"}
    address_building        {"大阪梅田駅"}
    address_phone_number    {"000-1111-2222"}
  end
end
