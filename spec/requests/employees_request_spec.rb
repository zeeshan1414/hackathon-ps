require 'rails_helper'

RSpec.describe "Employees", type: :request do
  let(:current_employee) { create(:employee) }

  before(:each) { sign_in current_employee }

  describe "GET /employees/:id/challenges" do
    it "returns http success" do
      get challenges_employee_path(current_employee)
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /employees/:id/collaborations" do
    it "returns http success" do
      get collaborations_employee_path(current_employee)
      expect(response).to have_http_status(:success)
    end
  end

end
