class VotesController < ApplicationController
  before_action :authenticate_user!
  befoer_filter :load_votable

  def index
    @votes = @votable.votes
  end

  def new
    @vote = @voteable.votes.new
  end

  def create
    @vote = @voteable.votes.new
  end
  


end
