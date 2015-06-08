require 'rails_helper'

RSpec.describe User, type: :model do

  it { validate_presence_of :company }

  describe 'scope of_company' do
    let(:company1) { create(:company) }
    let(:company2) { create(:company) }

    let(:users_company_1) do
      [
        create(:user, company: company1),
        create(:user, company: company1),
        create(:user, company: company1),
      ]
    end

    let!(:users_company_2) do
      [
        create(:user, company: company2),
        create(:user, company: company2),
        create(:user, company: company2),
      ]
    end

    before do
      @scoped_users = User.of_company company1
    end

    it "returns all users of company1" do
      expect(@scoped_users).to match_array users_company_1
    end
  end
end
