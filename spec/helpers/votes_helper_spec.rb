require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the VotesHelper. For example:
#
# describe VotesHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe VotesHelper, type: :helper do
  describe "created_at" do
    it "formats timestamp" do
      expect(helper.created_at("Mon, 08 Jun 2015 18:27:18 UTC +00:00".to_time)).to eq("Mon. June, 08 2015")
    end
  end
end
