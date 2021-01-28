require "rails_helper"

RSpec.describe ChallengesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/challenges").to route_to("challenges#index")
    end

    it "routes to #create" do
      expect(post: "/challenges").to route_to("challenges#create")
    end

    it "routes to #upvote" do
      expect(post: "/challenges/1/upvote").to route_to("challenges#upvote", id: "1")
    end

    it "routes to #collaborate" do
      expect(post: "/challenges/1/collaborate").to route_to("challenges#collaborate", id: "1")
    end
  end
end
