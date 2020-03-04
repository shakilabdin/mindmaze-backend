class GamesController < ApplicationController

    def index 
        games = Game.all 
        render json: games 
    end

    def show 
        game = Game.find(params[:id])
        render json: game
    end

    def create
        game = Game.create(game_params)
        render json: game
    end

    private 

    def game_params
        params.permit(:user_id, :category_id, :score)
    end

end
