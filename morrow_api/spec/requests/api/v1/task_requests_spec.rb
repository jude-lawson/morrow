require 'rails_helper'

RSpec.describe 'Task Requests' do
  describe 'POST /api/v1/tasks' do
    it 'should create a task with the correct information' do
      current_user = User.create!(first_name: 'Rory', last_name: 'Williams', email: 'thelastcenturion@na.moc')
      task_data = {
        user_id: current_user.id,
        title: 'A new task',
        body: 'This is a new task'
      }

      post '/api/v1/tasks', params: task_data.to_json

      expect(response).to be_successful
      expect(Task.last.title).to eq(task_data[:title])
      expect(Task.last.body).to eq(task_data[:body])
    end
  end
end
