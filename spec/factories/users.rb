FactoryBot.define do
  factory :user do
    name { 'MyString' }
    email { 'a@test.com' }
    image { Rack::Test::UploadedFile.new('spec/factories/cat_1.png', 'image/png') }
    is_enabled { true }
    password { 'password' }
    password_confirmation { 'password' }
  end
end
