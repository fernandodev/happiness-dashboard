class Company < ActiveRecord::Base
  has_many :users
  has_many :polls

  validates_presence_of :name

  accepts_nested_attributes_for :users

  def active_users
    users.actives
  end

  def activate_user(email, activate)
    users.where(email: email).first.try(:update, active: activate)
  end
end
