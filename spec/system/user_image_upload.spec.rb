require 'rails_helper'

describe '画像アップロード', type: :system do
  let(:correct_user) { FactoryBot.build(:user) }

  context 'valid_image' do
    it '新規登録され、詳細画面に画像が表示される' do
      visit new_user_path
      fill_in '名前', with: correct_user.name
      fill_in 'メールアドレス', with: correct_user.email
      attach_file('プロフィール画像', "#{Rails.root}/spec/factories/cat_1.png")
      fill_in 'パスワード', with: correct_user.password
      fill_in 'パスワード再入力', with: correct_user.password_confirmation
      click_button '登録する'

      expect(page).to have_content "#{User.model_name.human}を登録しました"
      expect(page.find('img')['src']).to have_content 'cat_1.png'
    end
  end

  context 'invalid_image_by_format_gif' do
    it '画像は削除される' do
      visit new_user_path
      fill_in '名前', with: correct_user.name
      fill_in 'メールアドレス', with: correct_user.email
      attach_file('プロフィール画像', "#{Rails.root}/spec/factories/hamster_01.gif")
      fill_in 'パスワード', with: correct_user.password
      fill_in 'パスワード再入力', with: correct_user.password_confirmation
      click_button '登録する'

      expect(page).to have_content 'はjpgかpngでアップロードしてください'
      expect(page).not_to have_selector 'img'
    end
  end

  context 'invalid_image_by_format_mov_and_too_large' do
    it '画像は削除される' do
      visit new_user_path
      fill_in '名前', with: correct_user.name
      fill_in 'メールアドレス', with: correct_user.email
      attach_file('プロフィール画像', "#{Rails.root}/spec/factories/big_and_mov_file.mov")
      fill_in 'パスワード', with: correct_user.password
      fill_in 'パスワード再入力', with: correct_user.password_confirmation
      click_button '登録する'

      expect(page).to have_content 'はjpgかpngでアップロードしてください', 'は5MBより大きいファイルはアップロードできません'
      expect(page).not_to have_selector 'img'
    end
  end
end
