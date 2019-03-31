require 'rails_helper'

describe 'それぞれのアクションが正常に動作するかチェック' do
  let!(:correct_user) { FactoryBot.create(:user) }

  it 'ユーザー新規登録画面が表示される' do
    visit new_user_path
    expect(page).to have_selector 'h1', text: "#{User.model_name.human}登録"
  end

  it 'ユーザー新規登録後、flashメッセージと共に登録ユーザーの詳細画面に移動する' do
    visit new_user_path
    fill_in '名前', with: 'test2'
    fill_in 'メールアドレス', with: 'test2@test.com'
    fill_in 'パスワード', with: 'password'
    fill_in 'パスワード再入力', with: 'password'
    click_button '登録する'

    expect(page).to have_content "#{User.model_name.human}登録をしました", 'test2@test.com'
  end

  it 'ユーザー詳細画面が表示される' do
    visit user_path(correct_user)
    expect(page).to have_selector 'h1', text: "#{User.model_name.human}詳細"
  end

  it 'ユーザー編集画面が表示される' do
    visit edit_user_path(correct_user)
    expect(page).to have_selector 'h1', text: "#{User.model_name.human}編集"
  end

  it 'ユーザー編集後、flashメッセージと共に登録ユーザーの詳細画面に移動する' do
    visit edit_user_path(correct_user)
    fill_in '名前', with: correct_user.email
    fill_in 'メールアドレス', with: 'change@test.com'
    fill_in 'パスワード', with: correct_user.password
    fill_in 'パスワード再入力', with: correct_user.password_confirmation
    click_button '更新する'
  
    expect(page).to have_content "#{User.model_name.human}を更新しました", 'change@test.com'
  end

  it '編集画面からユーザー削除後、flashメッセージと共に新規ユーザー登録画面に移動する' do
    visit edit_user_path(correct_user)
    click_on 'ユーザーを削除'
    page.driver.browser.switch_to.alert.accept

    expect(page).to have_content "#{User.model_name.human}を削除しました", "#{User.model_name.human}登録"
  end
end