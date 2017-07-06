class Admin::BaseController < ApplicationController
  before_action :ensure_admin_user!

  def ensure_admin_user!
    current_user&.admin?
  end

end
