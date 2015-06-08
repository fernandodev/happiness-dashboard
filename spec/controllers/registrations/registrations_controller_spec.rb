require 'rails_helper'

RSpec.describe Registrations::RegistrationsController, type: :controller do
  before do
    @request.env["devise.mapping"] = Devise.mappings[:user]
  end

  describe 'build_nested_attributes' do
    subject { controller.send(:build_nested_attributes, {}) }

    it 'returns a hash with company_attributes key' do
      expect(subject).to eq({ company_attributes: {} })
    end
  end
end
