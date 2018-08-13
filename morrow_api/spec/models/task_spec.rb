require 'rails_helper'

RSpec.describe Task do
  describe 'Validations' do
    it{ should validate_presence_of(:title) }
    it{ should validate_presence_of(:body) }
  end
end
