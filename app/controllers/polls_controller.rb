class PollsController < ApplicationController

  def index
    @polls = current_company.polls
  end

  def new
    @poll = build_poll
  end

  def create
    @poll = Poll.create_and_send_email permitted_params[:user_ids], current_company.id
    respond_with @poll, location: { action: :index }
  end

  protected

  def permitted_params
    permitted = params.require(:poll).permit(user_ids: [])
    permitted[:user_ids] = current_company.users.pluck(:id) & permitted[:user_ids].map(&:to_i)
    permitted
  end

  def build_poll
    @poll = Poll.new users: current_company.users
  end

end
