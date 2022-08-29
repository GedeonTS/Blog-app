require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    before(:example) { get user_posts_path(1) }
    it 'response status correct' do
      expect(response).to have_http_status(:success)
    end
  end
end
