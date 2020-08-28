class AuthController < ApplicationController
    def login
        if User.find_by(username: params[:username])
            user = User.find_by!(username: params[:username])
            
            if user.authenticate(params[:password])
                render json: {token: create_token(user.id, user.username, user.email, user.profile_pic)}
            else
                render json: {errors: ['Wrong username or password.']}, status: 422
            end
        else
            render json: {errors: ['Wrong username or password.']}, status: 422
        end
    end
end