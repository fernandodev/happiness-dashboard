require 'rails_helper'

RSpec.describe PollsHelper, type: :helper do

  describe "votes_controller?" do
    context "when get votes_controller" do
      it "returns true if requested controller is VotesController" do
        expect(helper.params).to receive(:[]).with(:controller) { 'votes' }
        expect(helper.votes_controller?).to eq true
      end
    end
  end
end
