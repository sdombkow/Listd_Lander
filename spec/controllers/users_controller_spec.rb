require 'spec_helper'

describe UsersController do

  describe "GET 'setPartner'" do
    it "returns http success" do
      get 'setPartner'
      response.should be_success
    end
  end

  describe "GET 'unsetPartner'" do
    it "returns http success" do
      get 'unsetPartner'
      response.should be_success
    end
  end

end
