require 'rails_helper'

RSpec.describe Company, type: :model do
  let(:company){ create :company }
  let(:users){ [create(:user, company: company), create(:user, company: company, active: false)] }

  it { validate_presence_of :name }
  it { respond_to :users }

  describe '#active_users' do

    subject{ company.active_users }

    it 'returns all active users' do
      expect(subject).to eq [users.first]
    end
  end

  describe '#activate_user' do
    let(:user){ create(:user, company: company) }

    it 'activates a revoked user' do
      company.activate_user user.email, true
      expect(find_user(user.email).active).to eq true
    end

    it 'revokes an access for user' do
      company.activate_user user.email, false
      expect(find_user(user.email).active).to eq false
    end

    def find_user(email)
      User.where(email: user.email).first
    end
  end
end
