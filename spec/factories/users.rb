FactoryBot.define do
  factory :user do
    name { 'MyString' }
    email { 'a@test.com' }
    is_enabled { true }
    password { 'password' }
    password_confirmation { 'password' }
  end
end
