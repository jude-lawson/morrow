class Api::V1::ApplicationController < ActionController::API
  def create_token(user_info)
    JWT.encode user_info['password'], ENV['APP_SECRET'], 'HS256'
  end

  def current_user
    provided_token = request.headers['Authorization'].split(' ')[1]
    User.find_by(token: provided_token)
  end

  def require_id_match
    if current_user.id.to_s != params[:id]
      render status: 403
    end
  end
end
