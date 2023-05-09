class ApplicationController < ActionController::Base
    before_action :require_logged_in, only: [:show, :edit, :update]
    before_action :require_logged_out, only: [:new, :create]

    
    def current_user
        return nil unless session[:session_token]
        @current_user ||= User.find_by(session_token: session[:session_token])
    end

    def require_logged_in
        redirect_to new_session_url unless logged_in?
    
end