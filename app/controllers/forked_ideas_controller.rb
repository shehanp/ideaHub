class ForkedIdeasController < ApplicationController

  before_action :authenticate_user!

  def create
    @idea = Idea.find(params[:idea_id])
    @forked_idea = @idea.dup
    @forked_idea.forked_from_idea = @idea
    @forked_idea.user = current_user
    if @forked_idea.save
      redirect_to @forked_idea, notice: "Forking this idea!"
    else
      redirect_to @idea, alert: "Unable to fork idea"
    end   
  end

end


