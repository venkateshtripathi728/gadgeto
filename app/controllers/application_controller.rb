class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  include Pundit

  after_action :verify_authorized, except: [:index,:mytools], unless: :skip_pundit?
  after_action :verify_policy_scoped, only: [:index,:mytools], unless: :skip_pundit?

  
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(root_path)
  end

  def configure_permitted_parameters
   
    devise_parameter_sanitizer.permit(:sign_up, keys: [:user_name, :description, :photo])

    devise_parameter_sanitizer.permit(:account_update, keys: [:user_name, :description,:email,:password, :photo])
  end

  private

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end
end
