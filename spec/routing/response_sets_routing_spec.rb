require "spec_helper"

describe ResponseSetsController do
  describe "routing" do

    it "routes to #index" do
      get("/response_sets").should route_to("response_sets#index")
    end

    it "routes to #new" do
      get("/response_sets/new").should route_to("response_sets#new")
    end

    it "routes to #show" do
      get("/response_sets/1").should route_to("response_sets#show", :id => "1")
    end

    it "routes to #edit" do
      get("/response_sets/1/edit").should route_to("response_sets#edit", :id => "1")
    end

    it "routes to #create" do
      post("/response_sets").should route_to("response_sets#create")
    end

    it "routes to #update" do
      put("/response_sets/1").should route_to("response_sets#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/response_sets/1").should route_to("response_sets#destroy", :id => "1")
    end

  end
end
