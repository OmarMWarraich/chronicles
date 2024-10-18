require 'rails_helper'

RSpec.describe "Leads", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/leads/index"
      expect(response).to have_http_status(:success)
    end
  end

end
