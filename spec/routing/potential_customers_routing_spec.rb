require "spec_helper"

describe PotentialCustomersController do
  describe "routing" do

    it "routes to #index" do
      get("/potential_customers").should route_to("potential_customers#index")
    end

    it "routes to #new" do
      get("/potential_customers/new").should route_to("potential_customers#new")
    end

    it "routes to #show" do
      get("/potential_customers/1").should route_to("potential_customers#show", :id => "1")
    end

    it "routes to #edit" do
      get("/potential_customers/1/edit").should route_to("potential_customers#edit", :id => "1")
    end

    it "routes to #create" do
      post("/potential_customers").should route_to("potential_customers#create")
    end

    it "routes to #update" do
      put("/potential_customers/1").should route_to("potential_customers#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/potential_customers/1").should route_to("potential_customers#destroy", :id => "1")
    end

  end
end
