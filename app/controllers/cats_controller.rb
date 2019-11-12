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
        @kitty = Cat.new
        render :new
    end

    def create
        @kitty = Cat.new(cat_params)
        if @kitty.save
            # show user the cat show page
            redirect_to cat_url(@kitty)
        else
            # show user the new cat form
            render :new
        end
    end

    def edit
        @kitty = Cat.find_by(id: params[:id])
        render :edit
    end

    def update
        @kitty.find_by(id: params[:id])

        if @kitty.update_attributes(cat_params)
            redirect_to cat_url(@kitty)
        else
            render :edit
        end
    end

    private
    
    def cat_params
        params.require(:cat).permit(:name, :birth_date, :color, :sex, :description)
    end

end