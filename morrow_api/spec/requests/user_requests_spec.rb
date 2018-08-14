require 'rails_helper'

RSpec.describe 'User Requests' do
  describe 'POST api/v1/users/:id' do
    it 'should create the user\'s profile information' do
      new_user_data = {
        first_name: 'Sally',
        last_name: 'Sparrow',
        email: 'ssparrow@na.moc'
      }

      post '/api/v1/users', params: new_user_data.to_json

      expect(new_user_data[:first_name]).to eq(User.last.first_name)
      expect(new_user_data[:last_name]).to eq(User.last.last_name)
      expect(new_user_data[:email]).to eq(User.last.email)
    end
  end
end
