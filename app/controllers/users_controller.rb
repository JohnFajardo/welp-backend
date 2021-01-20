class UsersController < ApplicationController
    before_action :get_user, only: [:show, :update, :destroy]

    def profile
        render json: current_user
    end

    def index
        @users = User.all
        render json: @users
    end

    def show
        render json: @user
    end

    def create
        @user = User.create(user_params)
        if @user.valid?
            render json: {token: create_token(@user.id, @user.name, @user.username, @user.email)}
        else
            render json: {errors: @user.errors.full_messages}, status: 422
        end
    end

    def update
        if @user.update(user_params)
            render json: {token: create_token(@user.id, @user.name, @user.username, @user.email)}
        else
            render json:{errors: @user.errors.full_messages}, status: 422
        end
    end

    def destroy
        @user.destroy
    end

    private

    def get_user
        @user = User.find(params[:id])
    end

    def user_params
        params.permit(:user, :id, :name, :username, :email, :password, :profile_pic)
    end
end