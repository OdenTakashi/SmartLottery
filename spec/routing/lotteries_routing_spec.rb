require "rails_helper"

RSpec.describe LotteriesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/lotteries").to route_to("lotteries#index")
    end

    it "routes to #new" do
      expect(get: "/lotteries/new").to route_to("lotteries#new")
    end

    it "routes to #show" do
      expect(get: "/lotteries/1").to route_to("lotteries#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/lotteries/1/edit").to route_to("lotteries#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/lotteries").to route_to("lotteries#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/lotteries/1").to route_to("lotteries#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/lotteries/1").to route_to("lotteries#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/lotteries/1").to route_to("lotteries#destroy", id: "1")
    end
  end
end
