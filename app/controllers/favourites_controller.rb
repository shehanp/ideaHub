class FavouritesController < ApplicationController
    before_action :authenticate_user!
    before_action :find_idea

    def create
        @favourite = @idea.favourites.new
        @favourite.user = current_user
        if @favourite.save
            redirect_to @idea, notice: "Idea has been favourited"
        else
            redirect_to @idea, alert: "Unable to favourite"
        end
    end

    def destroy
        @favourite = current_user.favourites.find(params[:id])
        if @favourite.destroy
            redirect_to @idea, notice: "Favourite Removed!"
        else
            redirect_to @idea, alert: "Favourites are forever"
        end
    end

    private

    def find_idea
        @idea = Idea.find(params[:idea_id])
    end

end
