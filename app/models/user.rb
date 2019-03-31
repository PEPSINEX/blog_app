class User < ApplicationRecord
  has_secure_password
  
  has_one_attached :image

  validates :name, presence: true, length: { minimum: 4 }
  validates :email, presence: true, uniqueness: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :password, length: { minimum: 8 } # has_secure_passwordメソッドにより、presence: trueも含まれる
  validate :validate_image

  def icon
    return self.image.variant(resize: '200x200')
  end

  private

  def validate_image
    return unless image.attached?
    
    errors.add(:image, I18n.t('errors.messages.too_large')) if image.blob.byte_size > 5.megabytes
    errors.add(:image, I18n.t('errors.messages.not_jpg_or_png')) unless jpg_or_png?
    image.purge if self.errors.messages[:image].present?
  end

  def jpg_or_png?
    permission_file_format = %w[image/jpeg image/png]
    permission_file_format.include?(image.blob.content_type)
  end
end
