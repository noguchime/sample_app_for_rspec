# 課題3該当要件：spec実行時にブラウザの表示有無を切り替える設定を spec/support 以下に追加してください。
RSpec.configure do |config|
  config.before(:each, type: :system) do
    driven_by :selenium, using: :headless_chrome
  end
end