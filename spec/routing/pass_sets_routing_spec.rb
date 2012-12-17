require "spec_helper"

describe PassSetsController do
  describe "routing" do

    it "routes to #index" do
      get("/pass_sets").should route_to("pass_sets#index")
    end

    it "routes to #new" do
      get("/pass_sets/new").should route_to("pass_sets#new")
    end

    it "routes to #show" do
      get("/pass_sets/1").should route_to("pass_sets#show", :id => "1")
    end

    it "routes to #edit" do
      get("/pass_sets/1/edit").should route_to("pass_sets#edit", :id => "1")
    end

    it "routes to #create" do
      post("/pass_sets").should route_to("pass_sets#create")
    end

    it "routes to #update" do
      put("/pass_sets/1").should route_to("pass_sets#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/pass_sets/1").should route_to("pass_sets#destroy", :id => "1")
    end

  end
end
