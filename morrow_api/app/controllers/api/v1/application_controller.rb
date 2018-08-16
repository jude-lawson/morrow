class Api::V1::ApplicationController < ActionController::API
  def create_token(user_info)
    JWT.encode user_info['password'], ENV['APP_SECRET'], 'HS256'
  end

  def current_user
    auth = request.headers['Authorization']
    if auth && !auth.nil?
      provided_token = auth.split(' ')[1]
      User.find_by(token: provided_token)
    else
      nil
    end
  end

  def require_id_match
    if current_user.class != User || current_user.id.to_s != params[:id]
      render status: 403
    end
  end
end
