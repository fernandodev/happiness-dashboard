class Vote < ActiveRecord::Base
  belongs_to :poll

  validates_presence_of :token, :poll

  before_validation :generate_token

  def save_rating!(rating, comment)
    if value.nil?
      update(value: rating, comment: comment)
    else
      errors.add(:value, "You already have voted")
    end

    self
  end

  def generate_token
    while true && token.nil? do
      self.token = SecureRandom.base64(10)
      break unless Vote.find_by token: self.token
    end
  end
end
