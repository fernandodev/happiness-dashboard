require 'rails_helper'

RSpec.describe User, type: :model do

  it { validate_presence_of :company }
end
