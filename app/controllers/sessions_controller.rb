class SessionsController < ApplicationController
    def new
    end 
    def create
        @username = form_params[:username]
        @password = form_params[:password]
        @user = User.find_by(username: @username).try(:authenticate, @password)
        if @user.present?
            session[:user_id] = @user.id
            redirect_to root_path
        else 
            render "new"
        end 
    end 
    def destroy 
        reset_session
        redirect_to root_path
    end
    def form_params
        params.require(:session).permit(:username, :password)
    end 
end
