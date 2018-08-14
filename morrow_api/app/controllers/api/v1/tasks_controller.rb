class Api::V1::TasksController < ApplicationController
  def create
    new_task_data = JSON.parse(request.body.string)
    new_task = Task.create!(new_task_data)
    render json: new_task
  end
end
