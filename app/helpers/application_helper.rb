module ApplicationHelper

  def votes_controller?
    params[:controller] == VotesController.name.underscore.gsub('_controller', '')
  end
end
