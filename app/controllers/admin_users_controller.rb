class AdminUsersController < ApplicationController
  
  def index
  end
  
  def new
    @admin_user = Admin_user.new
  end

  def show
  end

end
