class PollMailer < ApplicationMailer

  def poll_invite(user, vote, poll_created_at)
    @user = user
    @url = vote_votes_url(
      params: {
        vote: {
          token: vote.token
        }
      })
    mail(to: user.email, subject: "[HAPPYNEL] Pesquisa de Satisfação (#{poll_created_at.strftime "%d/%m/%Y"})")
  end

  def poll_result(user, average, comments, poll_created_at)
    @user = user
    @average = average
    @comments = comments
    mail(to: user.email, subject: "[HAPPYNEL] Resultado da Pesquisa de Satisfação (#{poll_created_at.strftime "%d/%m/%Y"})")
  end
end
