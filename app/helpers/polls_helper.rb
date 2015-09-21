module PollsHelper

  FULL_STAR = "<i class='fa fa-star fa-2x'></i>"
  HALF_STAR = "<i class='fa fa-star-half-o fa-2x'></i>"
  EMPTY_STAR = "<i class='fa fa-star-o fa-2x'></i>"

  END_STATUS = "<i class='fa fa-check-circle'></i>".html_safe
  RUNNING_STATUS = "<i class='fa fa-play-circle'></i>".html_safe

  def poll_average_stars(average)
    stars = ""

    full_stars = average.to_i
    half_star = average - average.to_i >= 0.5 ? 1 : 0
    empty_stars = 5 - half_star - full_stars

    (0..full_stars - 1).each { |i| stars += FULL_STAR }
    stars += HALF_STAR if half_star > 0
    (0..empty_stars - 1).each { stars += EMPTY_STAR }

    stars.html_safe
  end

  def poll_status(remaining)
    remaining > 0 ? RUNNING_STATUS : END_STATUS
  end

  def poll_user_box(email)
    gravatar_image_tag(email, file_type: :png, alt: email, :'class' => 'checkbox-gravatar-img') +
    "<div class='poll-user-email'><b>#{email.gsub(/@.*/, '')}</b></div>".html_safe
  end
end
