class DiscussionsController < ApplicationController
  before_action :find_idea


  def create
    @discussion = @idea.discussions.new(discussion_attributes)
    @discussion.user = current_user    
    if @discussion.save
      redirect_to @idea, notice: "discussion created successfully"
    else
      flash.now[:alert] = "Please attend to each form requirement"
      render "/idea/show"
    end
  end

  def destroy
    @discussion = @idea.discussions.find(params[:id])
    if @discussion.user == current_user && @discussion.destroy
      redirect_to @idea, notice: "discussion deleted"
    else
      redirect_to @idea, error: "There was an error trying to delete the discussion"
    end
  end

  private

  def discussion_attributes
    params.require(:discussion).permit(:body, {comment_attributes: [:body]})   
  end

  def find_idea
    @idea = Idea.find(params[:idea_id])
  end

end



