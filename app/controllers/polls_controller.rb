class PollsController < ApplicationController

  def index
    @polls = current_company.polls
  end

  def new
    @poll = Poll.new
  end

  def create
  end

  protected

  def permitted_params

  end

end
