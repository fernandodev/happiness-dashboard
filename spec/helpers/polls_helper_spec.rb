require 'rails_helper'

RSpec.describe PollsHelper, type: :helper do

  describe "poll_status" do

    it "draws a play icon if there are remaining people to vote" do
      expect(helper.poll_status 1).to eq PollsHelper::RUNNING_STATUS
    end

    it "draws a check circle icon if there are remaining people to vote" do
      expect(helper.poll_status 0).to eq PollsHelper::END_STATUS
    end
  end

  describe "poll_average_stars" do
    let(:five_empty_stars) do
      stars = PollsHelper::EMPTY_STAR + PollsHelper::EMPTY_STAR +
              PollsHelper::EMPTY_STAR + PollsHelper::EMPTY_STAR +
              PollsHelper::EMPTY_STAR
    end
    let(:five_full_stars) do
      stars = PollsHelper::FULL_STAR + PollsHelper::FULL_STAR +
              PollsHelper::FULL_STAR + PollsHelper::FULL_STAR +
              PollsHelper::FULL_STAR
    end
    let(:four_full_stars_and_half) do
      stars = PollsHelper::FULL_STAR + PollsHelper::FULL_STAR +
              PollsHelper::FULL_STAR + PollsHelper::FULL_STAR +
              PollsHelper::HALF_STAR
    end

    it "draws 5 full stars" do
      expect(helper.poll_average_stars 5).to eq five_full_stars.html_safe
    end

    it "draws stars with half star" do
      expect(helper.poll_average_stars 4.5).to eq four_full_stars_and_half.html_safe
    end
  end

end
