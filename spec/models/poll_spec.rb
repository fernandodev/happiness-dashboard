require 'rails_helper'

RSpec.describe Poll, type: :model do

  it { validate_presence_of :company }
end
