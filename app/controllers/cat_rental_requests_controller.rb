
class CatRentalRequestsController < ApplicationController

    def new

        render :new
    end

    def create

    end

    def show
        @cat_rental_requests = CatRentalRequest.order(start_date: :desc)
        render :show
    end

end