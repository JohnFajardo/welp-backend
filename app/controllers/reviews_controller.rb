class ReviewsController < ApplicationController
    def index
        @location = Location.find(params[:location_id])
        render json: @location, serializer: SingleLocationSerializer, user_id: params[:user_id]
    end

    def create
        @review = Review.create(review_params)
        render json: @review
    end

    private
    def review_params
        params.permit(:user_id, :location_id, :body, :review_pic, :score)
    end
end