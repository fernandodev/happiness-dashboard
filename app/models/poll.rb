class Poll < ActiveRecord::Base
  belongs_to :company
  has_many :poll_members
  has_many :users, through: :poll_members

  validates_presence_of :company
end
