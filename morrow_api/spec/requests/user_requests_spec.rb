require 'rails_helper'

RSpec.describe 'User Requests' do
  describe 'User Registration' do
    it 'should take in an encoded JWT, decode it, and store create the users' do
      expected_payload = {
        info: {
          first_name: 'John',
          last_name: 'Watson',
          email: 'jwatson@bakerstreet.moc',
          password: 'sherlocked'
        }
      } 

      post '/api/v1/users', params: expected_payload.to_json

      expect(response).to be_successful
      expect(response.body).to eq({ token: User.last.token }.to_json)
    end
  end
end
