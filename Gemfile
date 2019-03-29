source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.2'
gem 'rails', '~> 5.2.2', '>= 5.2.2.1'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'mini_racer', platforms: :ruby
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
gem 'bcrypt', '~> 3.1.7'
gem 'mini_magick', '~> 4.8'
# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development
gem 'bootsnap', '>= 1.1.0', require: false
gem 'slim-rails'  # Slimジェネレータ
gem 'html2slim' # ERB形式をslim形式に変換する「erb2sim」コマンドの提供
gem 'bootstrap', '~> 4.3.1' # デザイン用

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'pry-rails' # コンソールをpryに変更
  gem 'better_errors' # エラー画面がデバッグしやすい形式に
  gem 'binding_of_caller' # エラー画面でirbできる
  gem 'annotate'  # 「rails route」がmodelに表示
  gem 'letter_opener_web' # 開発環境におけるメール送信確認
  gem 'bullet'  # N+1問題のクエリを警告
  gem 'brakeman'  # セキュリティチェック
  gem 'rubocop', '~> 0.66.0', require: false  # コーディングルール
  gem "rubycritic", require: false  # コード品質チェック
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  gem 'chromedriver-helper'
  gem 'rspec-rails', '~> 3.8' # テストライブラリ
  gem 'factory_bot_rails' # Rspe用データ作成ライブラリ
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
