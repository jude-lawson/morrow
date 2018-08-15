require 'rails_helper'

RSpec.describe 'Task Requests' do
  before :each do
    @user1 = User.create!(first_name: 'John', last_name: 'Watson', email: 'jwatson@bakerstreet.com', password: 'sherlocked') 
    @task1 = @user1.tasks.create!(title: 'Title 1', body: 'Task 1 content')
    @task2 = @user1.tasks.create!(title: 'Title 2', body: 'Task 2 content')

    @user2 = User.create!(first_name: 'Sherlock', last_name: 'Holmes', email: 'sholmes@bakerstreet.moc', password: 'mycroftisannoying')
    @user2.tasks.create!(title: 'Title 3', body: 'Task 3 content')
  end

  describe 'GET /api/v1/users/:id/tasks' do
    it 'should return all tasks for that user' do
      allow_any_instance_of(Api::V1::ApplicationController).to receive(:current_user).and_return(@user1)
      get "/api/v1/users/#{@user1.id}/tasks"

      expect(response).to be_successful
      expect(response.body).to eq([@task1, @task2].to_json)
    end

    it 'should return a 403 if a user tries to access another user\'s tasks' do
      allow_any_instance_of(Api::V1::ApplicationController).to receive(:current_user).and_return(@user1)
      get "/api/v1/users/#{@user2.id}/tasks"

      expect(response).to have_http_status(403)
    end
  end
end
