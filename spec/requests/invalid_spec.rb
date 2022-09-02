require 'rails_helper'

RSpec.describe "Invalid", type: :request do
  describe "URLs will hit GET /not_found action" do
    it "and redirect to home page" do
      get "/invalid/not_found"
      expect(response).to have_http_status(:found)
      expect(response).to redirect_to root_path
      expect(flash[:danger]).to match(/The link your looking for doesn't exist!/)
    end
  end
end