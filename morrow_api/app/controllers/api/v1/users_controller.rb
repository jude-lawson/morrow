class Api::V1::UsersController < ApplicationController
  def create
    user_info = JSON.parse(request.body.string)['info']
    token = JWT.encode user_info['password'], nil, 'none'
    user_info['token'] = token
    user = User.create!(user_info)
    render json: { token: user.token }
  end
end
