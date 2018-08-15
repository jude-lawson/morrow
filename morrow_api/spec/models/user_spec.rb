require 'rails_helper'

RSpec.describe User do
  describe 'Validations' do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:email) }
    it { should have_secure_password }
  end

  describe 'Relationships' do
    it { should have_many(:tasks) }
  end
end
