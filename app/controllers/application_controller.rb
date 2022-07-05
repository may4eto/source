class ApplicationController < ActionController::Base
    skip_before_action :verify_authenticity_token
    helper_method :current_user, :is_logged_in?
    before_action :current_user
    def current_user
        if is_logged_in?
            @current_user = User.find(session[:user_id])
        else 
            @current_user = nil
        end
        @current_user
    end 
    def is_logged_in?
        session[:user_id].present?
    end 
    def force_login
        unless is_logged_in?
            flash[:error] = "Please log in to use this feature"
            redirect_to root_path 
        end 
    end
end
