class User < ApplicationRecord
  has_secure_password

  validates :name, presence: true, length: { minimum: 4 }
  validates :email, presence: true, uniqueness: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :password, length: { minimum: 8 } # has_secure_passwordメソッドにより、presence: trueも含まれる
end
