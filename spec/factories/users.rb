FactoryBot.define do
  factory :user do
    name { 'MyString' }
    email { 'a@test.com' }
    image { '' }
    is_enabled { true }
    password_digest { 'password' }
  end
end
