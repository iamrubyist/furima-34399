FactoryBot.define do
  factory :user do
    name                  {'test'}
    email                 {'test@example'}
    password              {'000000'}
    password_confirmation {password}
    last_name    　       {'高木'}
    first_name            {'雅弘'}
    last_name_jp          {'タカギ'} 
    irst_name_jp          {'マサヒロ'}
    birthday              {'1999,12,09'}

  end
end