class LikesController < ApplicationController

    def create
        @like = Like.create(like_params)
        render json: @like
    end

    def destroy
        @like = Like.find_by(review_id: params[:review_id], user_id: params[:user_id])
        @like.destroy
        render json: {id: params[:review_id].to_i}
    end

    private
    def like_params
        params.permit(:review_id, :user_id, :id)
    end
end