require 'spec_helper'

  describe Comment do
    it "does not allow creating a comment with less than three characters" do
      comment = Comment.new(body: "1")
      expect(comment).to_not be_valid
    end

    it "does not allow comment without a body" do
      comment = Comment.new
      expect(comment).to_not be_valid
      comment.save
      comment.errors.messages.should have_key(:body)    
    end
  end

  describe "cleaner" do
    it "removes repeated white spaces in the body" do
      comment = Comment.new(body: "body  with     extra          spaces.")
      comment.cleaner
      expect(comment.body).to eq("body with extra spaces.")
    end
  end

  describe "capitalize" do
    it "will capitalize the body" do
      comment = Comment.new(body: "lowercaselowercaselowercaselowercaselowercaselowercase")
      comment.capitalizer
      expect(comment.body).to eq("Lowercaselowercaselowercaselowercaselowercaselowercase")  
    end
  end


