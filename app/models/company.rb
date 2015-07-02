class Company < ActiveRecord::Base
  has_many :users
  has_many :polls

  validates_presence_of :name

  accepts_nested_attributes_for :users
end
