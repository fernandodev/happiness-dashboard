class UsersController < ApplicationController

  def index
    @users = current_user.company.users
  end


end
