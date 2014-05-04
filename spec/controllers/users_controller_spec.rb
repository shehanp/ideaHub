require 'spec_helper'

describe UsersController do

  describe "GET 'except:'" do
    it "returns http success" do
      get 'except:'
      response.should be_success
    end
  end

  describe "GET ':destroy'" do
    it "returns http success" do
      get ':destroy'
      response.should be_success
    end
  end

end
