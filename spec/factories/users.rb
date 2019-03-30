FactoryBot.define do
  factory :user do
    name { "MyString" }
    email { "MyString" }
    image { "MyString" }
    is_enabled { true }
    password_digest { "password" }
  end
end
