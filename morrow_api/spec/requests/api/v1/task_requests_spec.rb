require 'rails_helper'

RSpec.describe 'Task Requests' do
  before :each do
    @user1 = User.create!(first_name: 'John', last_name: 'Watson', email: 'jwatson@bakerstreet.com', password: 'sherlocked') 
    @task1 = @user1.tasks.create!(title: 'Title 1', body: 'Task 1 content')
    @task2 = @user1.tasks.create!(title: 'Title 2', body: 'Task 2 content')
  end

  describe 'GET /api/v1/users/:id/tasks' do
    it 'should return all tasks for that user' do
      get "/api/v1/users/#{@user1.id}/tasks"

      expect(response).to be_successful
      expect(response.body).to eq([@task1, @task2].to_json)
    end

    it 'should return a 404 with an error message if the user is not found' do
      get "/api/v1/users/#{@user1.id + 1}/tasks"

      expect(response).to have_http_status(404)
      expect(response.body).to eq({ error: "Couldn't find User with 'id'=#{@user1.id + 1}" }.to_json)
    end
  end
end
