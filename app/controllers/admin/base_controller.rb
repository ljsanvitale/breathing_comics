class Admin::BaseController < ApplicationController
  layout 'admin'
  before_action :require_login

  def require_login
    unless User.count == 0 || current_user
      redirect_to login_path
      return false
    end
  end

  private
   def not_authenticated
     redirect_to login_path, alert: "Please login first"
   end

end
