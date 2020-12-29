require_relative 'boot'
require 'rails/all'

Bundler.require(*Rails.groups)

module Myapp
class Application < Rails::Application
     config.load_defaults 5.2
     config.middleware.insert_before 0, Rack::Cors do
       allow do
         origins "http://localhost:5050"	# リクエストを許可したいURL
         resource "*",						# リクエストを許可するリソース（データ）
           headers: :any,				    # リクエストを許可するヘッダー
           methods: [:get, :post, :patch]    # リクエストを許可するメソッド
       end
     end
   end
end
