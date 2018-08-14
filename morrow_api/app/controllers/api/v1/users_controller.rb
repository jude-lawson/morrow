class Api::V1::UsersController < ApplicationController
  def create
    new_user_data = JSON.parse(request.body.string)
    User.create!(new_user_data)
  end
end
