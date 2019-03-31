require 'rails_helper'
 
describe '辞書機能、flash機能確認', type: :system do
  let(:correct_user) { FactoryBot.build(:user) }
  let(:incorrect_user) { FactoryBot.build(:user, password: 'notpass', password_confirmation: 'password') }

  describe 'リダイレクト後に表示される文言の確認' do
    before do
      visit new_user_path
    end

    context 'ユーザー新規作成した時' do
      before do
        fill_in '名前', with: correct_user.name
        fill_in 'メールアドレス', with: correct_user.email
        fill_in 'パスワード', with: correct_user.password
        fill_in 'パスワード再入力', with: correct_user.password_confirmation
        click_button '登録'
      end

      it '登録したユーザーの詳細画面が表示される' do
        expect(page).to have_content "#{User.model_name.human}登録をしました", "#{User.model_name.human}詳細"
      end
    end
  end
end