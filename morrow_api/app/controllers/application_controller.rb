class ApplicationController < ActionController::API
  def create_token(user_info)
    JWT.encode user_info['password'], ENV['APP_SECRET'], 'HS256'
  end
end
