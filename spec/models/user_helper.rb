require 'spec_helper'

describe User do
  describe "full name" do
    it "accepts the first name if it exists" do
      user = User.new(first_name:"shehan", last_name:"perera")
      expect(user.full_name).to include("shehan")
    end

    it "accepts the last name if it exists" do
      user = User.new(first_name:"shehan", last_name:"perera")
      expect(user.full_name).to include("perera")
    end
  end
end