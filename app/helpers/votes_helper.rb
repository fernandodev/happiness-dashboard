module VotesHelper

  def created_at(date)
    date.strftime("%a. %B, %d %Y")
  end
end
