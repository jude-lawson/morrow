class Api::V1::UsersController < ApplicationController
  def create
    user = create_user(request.body.string)
    render json: { token: user.token }
  end

  private

  def create_user(payload)
    info = JSON.parse(payload)['info']
    info['token'] = create_token(info)
    User.create!(info)
  end
end
