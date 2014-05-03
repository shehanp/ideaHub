class CommentsController < ApplicationController
before_action :authenticate_user!

  def create
    @discussion = Discussion.find(params[:discussion_id])
    @comment = Comment.create(params.require(:comment).permit(:body))
    if comment.save
      redirect_to discussion.question
    else
      flash.now[:alert] = "comment was not saved"
    end
  end

  def destroy
    @comment = comment.find(params[:id])
    @comment.destroy
    render nothing: true
  end
end


