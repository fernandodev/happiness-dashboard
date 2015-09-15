require 'rails_helper'

RSpec.describe Vote, type: :model do

  it { validate_presence_of :token }
  it { validate_presence_of :poll }

  describe '#generate_token' do
    let(:vote) { build(:vote) }

    subject { vote.save! }

    it "creates token after save" do
      subject
      expect(vote.token).not_to be_nil
    end
  end

  describe '#save_rating!' do

    context "when rating is nil" do
      let(:vote) { create(:vote) }
      subject { vote.save_rating! 4, '' }

      it "saves vote" do
        expect(subject.errors).to be_empty
      end
    end

    context "when rating is not nil" do
      let(:vote) { create(:vote, value: 2) }
      subject { vote.save_rating! 4, nil }

      it "doesn't save vote" do
        expect(subject.errors).not_to be_empty
      end
    end

  end
end
