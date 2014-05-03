class IdeasController < ApplicationController
before_action :authenticate_user!, except: [:index]
before_action :find_idea, except: [:index, :create, :new]

  def index
    if params[:tag]
      @ideas = Idea.tagged_with(params[:tag])
    elsif params[:query].present?
      @ideas = Idea.search(params)
    else
      @ideas = Idea.all
    end
  end

  def new
    @idea = Idea.new
  end

  def create
    @idea = Idea.new(idea_attributes)
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
        redirect_to products_path, notice: "Idea has been updated"
      else
        render :edit
      end
  end

  def show
    @idea = Idea.find(params[:id])
    @discussion = Discussion.new
    # @favourite = current_user.favourite_for(@idea)
    # @vote = current_user.vote_for(@idea) || Vote.new
    # @discussion = @idea.discussion.ordered_by_creation
  end

  def destroy
    if @idea.destroy
      redirect_to ideas_path, notice: "idea has been deleted"
    else
      redirect_to ideas_path, notice: "idea has been deleted"
    end
  end

  private

  def idea_attributes
    params.require(:idea).permit([:title, :body, :tag_list])
  end

  def find_idea
    @idea = Idea.find(params[:id])
  end

  
end
