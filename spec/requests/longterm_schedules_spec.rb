require 'rails_helper'

RSpec.describe "LongtermSchedules", type: :request do
  describe "GET /create" do
    it "returns http success" do
      get "/longterm_schedules/create"
      expect(response).to have_http_status(:success)
    end
  end

end
