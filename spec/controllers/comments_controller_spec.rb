require 'spec_helper'

describe CommentsController do
  let(:comment) { create(:comment)}

  describe "#create" do

    def valid_request
      post :create, comment_id: comment.id, comment: {body: "Valid body"}
    end

    it "creates a comment in the database with valid params" do
      expect do
        expect { valid_request }.to change {Comment.count }.by(1)
      end
    end

    it "associates the comment with thediscussion whose id is passed" do
      expect do
        valid_request
      end.to change {discussion.comments.count }.by(1)
    end

  end
end