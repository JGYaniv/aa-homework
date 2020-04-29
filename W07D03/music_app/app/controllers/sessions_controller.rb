class SessionsController < ApplicationController
    def new
    end

    def create
        @user = User.find_by(email: session_params[:email])
        if @user && @user.is_password?(session_params[:password])
            login(@user)
            redirect_to user_url(@user)
        else
            flash[:errors] = ["invalid username and/or password"]
            render :new
        end
    end

    def destroy
        logout
        redirect_to new_session_url
    end

    private

    def session_params
        params.require(:session).permit(:email, :password)
    end
end