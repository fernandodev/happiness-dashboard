require 'rails_helper'

RSpec.describe User, type: :model do

  it { validate_presence_of :company }
  it { respond_to :polls }
  it { respond_to :poll_members }

  describe 'scope of_company' do
    let(:company1) { create(:company) }
    let(:company2) { create(:company) }

    let(:users_company_1) do
      [
        create(:user, company: company1),
        create(:user, company: company1, active: false),
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

    let!(:active_users_company_1) do
      [
        users_company_1[0],
        users_company_1[2]
      ]
    end

    before do
      @scoped_users = User.actives_of_company company1
    end

    it "returns all active users of company1" do
      expect(@scoped_users).to match_array active_users_company_1
    end
  end
end
