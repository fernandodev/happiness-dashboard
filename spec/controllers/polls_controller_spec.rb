require 'rails_helper'

RSpec.describe PollsController, type: :controller do
  let(:user) { create(:user) }

  before do
    sign_in user
  end

  describe '#index' do
    subject { get :index }

    it 'renders all company polls' do
      expect(user.company).to receive(:polls)
      subject
    end
  end

  describe '#new' do
    subject { get :new }

    it 'builds a new poll with all users in company' do
      expect(Poll).to receive(:new).with(users: user.company.users)
      subject
    end
  end

  describe '#create' do
    let(:params) do
      {
        poll: {
          user_ids: user.company.users.pluck(:id)
        }
      }
    end

    subject { post :create, params }

    it 'creates and sends email to each user added in poll' do
      expect(Poll).to receive(:create_and_send_email).with(params[:poll][:user_ids], user.company_id)
      subject
    end
  end
end
