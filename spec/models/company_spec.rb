require 'rails_helper'

RSpec.describe Company, type: :model do

  it { validate_presence_of :name }
  it { respond_to :users }
end
