class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            login(@user)
            render :show
        else
            flash[:errors] = ["username or password invalid"]
            render :new
        end
    end

    def show
        ensure_logged_in
        @user = User.find(params[:id])
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        if @user.nil?
            flash[:errors] = ["invalid user params"]
            redirect_to new_session_url
        end
        if @user.update(user_params)
            render :show
        else
            flash[:errors] = ["invalid update params"]
            render :show
        end
    end

    def delete
    end

    private

    def user_params
        params.require(:user).permit(:email, :password)
    end
end