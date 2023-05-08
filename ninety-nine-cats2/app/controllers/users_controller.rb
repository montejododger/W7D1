class UsersController < ApplicationController
    # before_action :require_logged_in, only: [:show, :edit, :update]
    # before_action :require_logged_out, only: [:new, :create]

    
    def new
        @user = User.new
        render :new 
    end 

    def create
        @user = User.new(user_params)
        if @user.save 
            login!(@user)
            redirect_to cats_url
        else 
            render :new 
        end 

    end 

    private 

    def user_params
        params.require(:user).permit(:username, :session_token, :password_digest)

    end 
end
