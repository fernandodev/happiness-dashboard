require 'rails_helper'

RSpec.describe VotesController, type: :controller do

  describe '#vote' do
    let(:params) do
      {
        vote: {
          token: 'TOKEN'
        }
      }
    end
    subject { get :vote, params }

    context 'when vote was not votted yet' do
      let(:vote) { build(:vote, token: 'TOKEN') }

      before do
        allow(Vote).to receive(:find_by) { vote }
      end

      it 'renders vote view' do
        expect(subject).to be_success
      end
    end

    context 'when vote was already votted' do
      let(:vote) { build(:vote, value: 1, token: 'TOKEN') }

      before do
        allow(Vote).to receive(:find_by) { vote }
      end

      it 'renders vote view' do
        expect(subject).to redirect_to action: :done
      end
    end

  end

  describe '#update' do
    let(:vote) { build(:vote, id: 1, token: 'TOKEN') }
    let(:params) do
      {
        id: 1,
        vote: {
          value: '3',
          token: 'TOKEN',
          comment: ''
        }
      }
    end

    subject { put :update, params }

    before do
      allow(Vote).to receive(:find_by) { vote }
    end

    it 'updates vote value' do
      expect(vote).to receive(:save_rating!).with(params[:vote][:value], params[:vote][:comment])
      expect(subject).to redirect_to action: :done
    end
  end

  describe '#done' do

    subject { get :done }

    it 'renders finished view' do
      expect(subject).to be_success
    end
  end
end
