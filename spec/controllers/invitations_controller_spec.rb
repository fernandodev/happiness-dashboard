require 'rails_helper'

RSpec.describe InvitationsController, type: :controller do
  let(:user) { create(:user) }

  before do
    sign_in user
  end

  describe '#index' do
    subject { get :index }

    it 'assigns users to current company users' do
      subject
      expect(assigns(:users)).to eq user.company.users
    end
  end

  describe '#new' do
    subject { get :new }

    it 'instantiates a new user' do
      expect(User).to receive :new
      subject
    end
  end

  describe '#create' do
    let(:params) do
      {
        user: {
          email: 'random@email.com'
        }
      }
    end

    subject { post :create, params }

    it 'sends invitation to user with <email>' do
      expect(User).to receive(:invite!).with({
                                                email: params[:user][:email],
                                                company_id: user.company_id
                                              })
      subject
    end

    it 'renders mail invitation' do
      subject
      expect(response).to render_template("devise/mailer/invitation_instructions")
    end
  end
end
