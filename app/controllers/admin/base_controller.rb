class Admin::BaseController < ApplicationController
  before_action :ensure_admin_user!

  def ensure_admin_user!
    redirect_to root_path, danger: "Dost thou mock me?" unless current_user&.admin?
  end

end
