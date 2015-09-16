class InvitationsController < ApplicationController

  def index
    @users = current_company.users
  end

  def new
    @user = User.new
  end

  def create
    @user = User.invite! email: permitted_params[:email], company_id: current_company.id
    respond_with @user, location: { action: :index }
  end

  def update
    @user = current_company.activate_user(permitted_params[:email], permitted_params[:active])
    respond_with @user, location: { action: :index }
  end

  protected

  def permitted_params
    params.require(:user).permit(:email, :active)
  end

end
