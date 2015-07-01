class Poll < ActiveRecord::Base
  belongs_to :company
  has_many :poll_members
  has_many :users, through: :poll_members
  has_many :votes

  validates_presence_of :company

  before_save :create_vote_invitations

  scope :average_of_company, lambda { |company|
    average = 0
    polls = where(company: company)
    votes = Vote.where(poll: polls).where.not(value: nil)
    average = votes.sum(:value) / votes.count(:value).to_f unless votes.empty?
    average
  }

  def self.create_and_send_email(user_ids, company_id)
    poll = Poll.new(user_ids: user_ids, company_id: company_id)
    if poll.save!
      poll.users.each_with_index do |u, i|
        PollMailer.poll_invite(u, poll.votes[i]).deliver_now
      end
    end

    poll
  end

  def average
    average = 0
    average = votes.sum(:value) / votes.count(:value).to_f if votes.try(:count, :value) > 0
    average
  end

  def remaining
    remaining = users.count - votes.try(:count, :value)
  end

  def create_vote_invitations
    (0..users.size - 1).each do
      self.votes.new
    end
  end
end
