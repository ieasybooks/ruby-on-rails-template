require "rails_helper"

RSpec.describe "Statics" do
  describe "GET /home" do
    it "returns http success" do
      get "/"

      expect(response).to have_http_status(:success)
    end
  end
end
