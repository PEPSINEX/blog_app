# 日本語の辞書ファイルを読み込ませる
Rails.application.config.i18n.default_locale = :ja
# 「/config/locales」配下全てのymlファイルを全て読み込む
Rails.application.config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}').to_s]
