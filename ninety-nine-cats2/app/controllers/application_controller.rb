class ApplicationController < ActionController::Base
    before_action :require_logged_in, only: [:show, :edit, :update]
    before_action :require_logged_out, only: [:new, :create]

end