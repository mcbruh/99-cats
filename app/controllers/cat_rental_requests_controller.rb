
class CatRentalRequestsController < ApplicationController

    def new
        render :new
    end

    def create
        @cat_rental_request = CatRentalRequest.new(cat_rental_requests_params)
        if @cat_rental_request.save
            redirect_to cat_rental_request_url(@cat_rental_request)
        else
            render :new
        end
    end

    def show
        @cat_rental_requests = CatRentalRequest.order(start_date: :desc)
        render :show
    end

    private_methods

    def cat_rental_requests_params
        params.require(:cat_rental_requests).permit(:cat_id, :start_date, :end_date)
    end

end