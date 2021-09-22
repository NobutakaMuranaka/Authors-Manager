class AdminUsersController < ApplicationController
  
  def index
  end
  
  def new
    @admin_user = AdminUser.new 
  end

  def show
  end

end
