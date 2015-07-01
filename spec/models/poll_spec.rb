require 'rails_helper'

RSpec.describe Poll, type: :model do
  let(:company) { create :company }
  let(:user_1) { create(:user, company: company) }
  let(:user_2) { create(:user, company: company) }
  let(:poll) { create(:poll, users: [user_1, user_2], company: company) }

  it { validate_presence_of :company }
  it { respond_to :users }
  it { respond_to :poll_members }

  describe '#average' do

    context "no votes registered" do

      it "returns 0" do
        expect(poll.average).to eq 0
      end
    end

    context "at least one vote registered" do
      let(:rating) { 1 }

      before do
        poll.votes.first.save_rating! rating
      end

      it "returns 1" do
        expect(poll.average).to eq rating
      end
    end
  end

  describe '#remaining' do

    context "no votes registered" do

      it "remains 2 votes" do
        expect(poll.remaining).to eq 2
      end
    end

    context "at least one vote registered" do
      let(:rating) { 1 }

      before do
        poll.votes.first.save_rating! rating
      end

      it "remains 1 votes" do
        expect(poll.remaining).to eq 1
      end
    end
  end

  describe '#create_vote_invitations' do
    subject { poll }

    it "creates an unique vote for each user in poll" do
      subject
      expect(poll.votes.count).to eq poll.users.count
    end
  end

  describe '#create_and_send_email' do
    subject { Poll.create_and_send_email [user_1.id, user_2.id], company.id }

    it "send an email to each user in poll" do
      expect { subject }.to change { ActionMailer::Base.deliveries.count }.by(poll.users.count)
    end
  end

  describe '#average_of_company' do
    let(:poll_1) { create(:poll, users: [user_1, user_2], company: company) }
    let(:poll_2) { create(:poll, users: [user_1, user_2], company: company) }

    before do
      poll_1.votes.each do |vote|
        vote.save_rating! 3
      end

      poll_2.votes.each do |vote|
        vote.save_rating! 4
      end
    end

    it "returns 3.5 as company average" do
      expect(Poll.average_of_company company).to eq 3.5
    end
  end
end
