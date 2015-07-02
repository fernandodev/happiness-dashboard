class PollMailer < ApplicationMailer

  def poll_invite(user, vote)
    @user = user
    @url = vote_votes_url(
      params: {
        vote: {
          token: vote.token
        }
      })
    mail(to: user.email, subject: "[HAPPYNEL] Pesquisa de satisfação (#{Time.now.strftime "%d/%m/%Y"})")
  end
end
