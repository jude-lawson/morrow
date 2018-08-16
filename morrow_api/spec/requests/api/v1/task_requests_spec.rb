require 'rails_helper'

RSpec.describe 'Task Requests' do
  before :each do
    app_controller = Api::V1::ApplicationController.new
    user1_data = { first_name: 'John', last_name: 'Watson', email: 'jwatson@bakerstreet.com', password: 'sherlocked' }
    user1_data['token'] = app_controller.create_token(user1_data[:password])
    @user1 = User.create!(user1_data) 
    @task1 = @user1.tasks.create!(title: 'Title 1', body: 'Task 1 content')
    @task2 = @user1.tasks.create!(title: 'Title 2', body: 'Task 2 content')

    user2_data = { first_name: 'Sherlock', last_name: 'Holmes', email: 'sholmes@bakerstreet.moc', password: 'mycroftisannoying' }
    user2_data['token'] = app_controller.create_token(user2_data[:password])
    @user2 = User.create!(user2_data)
    @user2.tasks.create!(title: 'Title 3', body: 'Task 3 content')
  end

  describe 'GET /api/v1/users/:id/tasks' do
    it 'should return all tasks for that user' do
      get "/api/v1/users/#{@user1.id}/tasks", headers: { 'Authorization': "Bearer #{@user1.token}" }

      expect(response).to be_successful
      expect(response.body).to eq([@task1, @task2].to_json)
    end

    it 'should return a 403 if a user tries to access another user\'s tasks' do
      get "/api/v1/users/#{@user2.id}/tasks", headers: { 'Authorization': "Bearer #{@user1.token}" }

      expect(response).to have_http_status(403)
    end

    it 'should return 403 if the Authorization header is empty or not provided' do
      get "/api/v1/users/#{@user2.id}/tasks", headers: { 'Authorization': "Bearer " }

      expect(response).to have_http_status(403)

      get "/api/v1/users/#{@user2.id}/tasks"

      expect(response).to have_http_status(403)
    end
  end
end
