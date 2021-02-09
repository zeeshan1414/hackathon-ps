require "rails_helper"

RSpec.describe EmployeesController, type: :routing do
  describe "routing" do
    it "routes to #challenges" do
      expect(get: "/employees/11/challenges").to route_to("employees#challenges", id: "11")
    end

    it "routes to #collaborations" do
      expect(get: "/employees/11/collaborations").to route_to("employees#collaborations", id: "11")
    end
  end
end
