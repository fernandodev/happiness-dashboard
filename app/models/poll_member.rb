class PollMember < ActiveRecord::Base
  belongs_to :poll
  belongs_to :user

  validates_presence_of :poll, :user
end
