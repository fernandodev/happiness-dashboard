require 'rails_helper'

RSpec.describe ApplicationController, type: :controller do
  let(:user) { create(:user) }

  before do
    sign_in user
  end

  describe 'current_company' do
    subject { controller.send(:current_company) }

    it "returns current_user's company" do
      expect(subject).to eq user.company
    end
  end

end
