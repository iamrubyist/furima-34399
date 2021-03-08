FactoryBot.define do
  factory :purchase do
    postal_code_id {111-1111}
    prefectures    {1}
    municipality   {"可児市"}
    address        {111-1}
    phone_number   {09012341234}
    building_name  {"名古屋ビル"}
    buy_market     {1}
  end
end