class CatsController < ApplicationController

    def index
        @cats = Cat.all
        render :index
    end

    def show
        @kitty = Cat.find_by(id: params[:id])
        
        if @kitty
            render :show
        else
            redirect_to cats_url
        end
    end

    def new
        render :new
    end

    def create
        kitty = Cat.new
        if kitty.save
            render kitty
        else
            render json: kitty.errors.full_messages
        end
    end

    def edit
        render :edit
    end

end