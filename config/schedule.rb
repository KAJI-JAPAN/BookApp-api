# Rails.rootを使用するために必要
require File.expand_path(File.dirname(__FILE__) + "/environment")
ENV.each { |k, v| env(k, v) } 
# cronを実行する環境変数
# rails_env = ENV["API_DOMAIN"] || :development
# cronを実行する環境変数をセット
# set :environment, rails_env
# cronのログの吐き出し場所
set :output, "#{Rails.root}/log/cron.log"
set :environment, :development

# １日ごとにゲストユーザーを削除
every 1.days do
  runner "User.guest_reset"
end
