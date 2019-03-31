require 'rails_helper'

RSpec.describe User, type: :model do
  let(:current_user) { FactoryBot.build(:user) }

  describe '画像アップロード' do
    context '画像のファイル形式がgifの時' do
      image_file = Rack::Test::UploadedFile.new('spec/factories/hamster_01.gif', 'image/gif')
      let(:gif_image) { FactoryBot.build(:user, image: image_file ) }

      it 'jpegかpngでアップロードしてください' do
        expect(gif_image).not_to be_valid
      end
    end

    context '画像のファイル形式が正常の時' do
      image_file = Rack::Test::UploadedFile.new('spec/factories/cat_1.png', 'image/png')
      let(:valid_image) { FactoryBot.build(:user, image: image_file ) }

      it 'jpegかpngでアップロードしてください' do
        expect(valid_image).to be_valid
      end
    end
  end
end
