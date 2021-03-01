FactoryBot.define do
  factory :user do
    name                  {'test'}
    email                 {'test@example'}
    password              {'000000'}
    password_confirmation {password}
    first_name            {'高木'}
    last_name             {'雅弘'}
    first_name_jp         {'タカギ'}
    last_name_jp          {'マサヒロ'}

  end
end