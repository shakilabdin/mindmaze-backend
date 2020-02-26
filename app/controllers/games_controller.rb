class GamesController < ApplicationController

    def index 
        games = Game.all 
        render json: games 
    end

    def create
        
    end

    private 

    def game_params
        params.permit(:user_id, :category_id, :score)
    end

end
