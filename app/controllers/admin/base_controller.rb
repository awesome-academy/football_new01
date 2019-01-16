class Admin::BaseController < ApplicationController
  before_action :authenticate_user!, :require_admin

  layout "admin"

  private

  def require_admin
    return if current_user.admin?
    raise CanCan::AccessDenied
  end
end
