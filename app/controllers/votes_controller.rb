class VotesController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :vote_by_token, except: [:done, :not_found]

  def vote
    redirect_to action: :done unless @vote.try(:value).nil?
  end

  def update
    @vote.save_rating!(permitted_params[:value])
    respond_with @vote, location: { action: :done }
  end

  def done; end

  protected

  def permitted_params
    params.require(:vote).permit(:token, :value, :comment)
  end

  def vote_by_token
    @vote = Vote.find_by token: permitted_params[:token]
  end
end
