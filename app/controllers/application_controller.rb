# -*- encoding : utf-8 -*-
class ApplicationController < ActionController::Base
  protect_from_forgery

  def check_access
    redirect_to root_url unless (current_user && current_user.admin?)
  end

end
