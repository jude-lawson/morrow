class Api::V1::Users::TasksController < Api::V1::ApplicationController
  before_action :require_id_match, only: [:index]
  
  def index
    begin
      user_tasks = User.find(params[:id]).tasks
      render json: user_tasks
    rescue => error
      render json: { error: error.to_s }, status: 404
    end
  end
end
