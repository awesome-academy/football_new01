class ApplicationController < ActionController::Base
  before_action :set_search
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  rescue_from ActiveRecord::RecordNotFound do |exception|
    respond_to do |format|
      format.json{head :forbidden}
      format.html{redirect_to root_path, alert: exception.message}
    end
  end
  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.json{head :forbidden}
      format.html{redirect_to root_path, alert: exception.message}
    end
  end

  def set_search
    @search = Team.search params[:q]
    @teams = @search.result.newest
                    .paginate page: params[:page], per_page: Settings.teams.page
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: User::USER_PARAMS)
    devise_parameter_sanitizer.permit(:account_update, keys: User::USER_PARAMS)
  end
end
