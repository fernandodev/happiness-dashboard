class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable

  belongs_to :company
  has_many :poll_members
  has_many :polls, through: :poll_members

  validates_presence_of :company

  accepts_nested_attributes_for :company

  scope :actives, -> { where(active: true) }
  scope :actives_of_company, -> (company){ where(company: company, active: true) }

  def active_for_authentication?
    super && active
  end

end
