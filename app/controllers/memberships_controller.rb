class MembershipsController < ApplicationController

  before_action :authenticate_user!, only: [:create]

  def index
    @idea = Idea.find(params[:idea_id])
    @members = @idea.members
    @mem_count = @idea.members.count
    # @task_count = @idea.tasks.count
    # @disc_count = @idea.discussions.count
  end #end index

  def create
    @idea = Idea.find(params[:idea_id])
    @membership = Membership.new
    @membership.user = current_user
    @membership.idea = @idea
    
    respond_to do |format|
      if @membership.save
        @mem_count = @idea.members.count
        format.html { redirect_to idea_memberships_path(@idea), notice: "Thanks for joining" }
        format.js { render }
      else
        Rails.logger.info @membership.errors.full_messages
        format.html { render 'index' }
        format.js { render js: "alert('Sorry you were not properly added to the idea')"}
      end
    end #end respond to
  
  end # end create


end # end Memberships Controller
