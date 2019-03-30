Rails.application.config.generators do |g|
  g.assets          false  # CSS/JSファイル生成せず
  g.helper          false
  g.jbuilder        false
  g.resource_route   true
  g.test_framework :rspec,   # テストフレームワークはrspecを使用
    view_specs:         false,
    helper_specs:       false,
    request_specs:      false,
    integration_tool:   false,
    controller_specs:   false,
    routing_specs:       true,
    model_specs:         true,
    fixtures:            true
  g.fixture_replacement :factory_bot, dir: "spec/factories"  # fixtureはfactory_botでディレクトリを変更
end