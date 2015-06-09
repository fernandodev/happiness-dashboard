require 'rails_helper'

RSpec.describe Poll, type: :model do

  it { validate_presence_of :company }
  it { respond_to :users }
  it { respond_to :poll_members }
end
