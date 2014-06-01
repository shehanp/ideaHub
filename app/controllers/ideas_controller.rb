class IdeasController < ApplicationController
before_filter :authorize, only: [:edit, :update]
before_action :find_idea, except: [:index, :create, :new]

  def index
    if params[:tag]
      @ideas = Idea.tagged_with(params[:tag])
    elsif params[:query].present?
      @ideas = Idea.search(params)
    else
      @ideas = Idea.all.highest_voted
    end
  end

  def new
    @idea = Idea.new
  end

  def create
    @idea = Idea.new(idea_attributes)
    @idea.user = current_user
      if @idea.save
        redirect_to ideas_path, notice: "Idea has been created!"
      else
        redirect_to ideas_path, notice: "Unable to create idea"
      end
  end

  def edit
  end

  def update
      if @idea.update_attributes(idea_attributes)
        redirect_to ideas_path, notice: "Idea has been updated"
      else
        render :edit
      end
  end

  def show
    @idea = Idea.find(params[:id])
    @discussion = Discussion.new
    @discussions  = @idea.discussions.ordered_by_creation
    @discussions_count = @idea.discussions.count
    # @comments     = @discussions.comments.ordered_by_creation
    # @favourite = current_user.favourite_for(@idea)
  end

  def destroy
    if @idea.destroy
      redirect_to ideas_path, notice: "idea has been deleted"
    else
      redirect_to ideas_path, notice: "idea has been deleted"
    end
  end

  def upvote
    @idea = Idea.find(params[:id])
    @idea.liked_by current_user
    redirect_to @idea
  end

  def downvote
    @idea = Idea.find(params[:id])
    @idea.downvote_from current_user
    redirect_to @idea
  end

  # def fork
  #   @idea = Idea.find(params[:id])
  #   @forked_idea = Idea.new(title: @idea.title, body: @idea.body, tag_list: @idea.tag_list, image: @idea.image)
  #   @forked_idea.save
  # end

  private

  def idea_attributes
    params.require(:idea).permit([:title, :body, :tag_list, :image])
  end

  def find_idea
    @idea = Idea.find(params[:id])
  end

  
end
