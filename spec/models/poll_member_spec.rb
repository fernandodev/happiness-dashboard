require 'rails_helper'

RSpec.describe PollMember, type: :model do

  it { validate_presence_of :poll }
  it { validate_presence_of :user }
end
