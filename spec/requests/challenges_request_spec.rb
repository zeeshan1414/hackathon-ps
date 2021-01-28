require 'rails_helper'

RSpec.describe '/challenges', type: :request do
  let(:current_employee) { create(:employee, employee_id: 'emp_103') }
  let(:challenge) { create(:challenge) }

  let(:valid_attributes) {
    { title: 'MyTitle', description: 'MyDescription', employee: current_employee, tag_id: create(:tag).id }
  }

  let(:invalid_attributes) {
    { title: '', description: '', employee: nil, tag: nil }
  }

  before(:each) { sign_in current_employee }

  describe 'GET /index' do
    it 'renders a successful response' do
      Challenge.create! valid_attributes
      get challenges_url
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Challenge' do
        expect {
          post challenges_url, params: { challenge: valid_attributes }
        }.to change(Challenge, :count).by(1)
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Challenge' do
        expect {
          post challenges_url, params: { challenge: invalid_attributes }
        }.to change(Challenge, :count).by(0)
      end
    end

    it 'redirects to the challenges list' do
      post challenges_url, params: { challenge: valid_attributes }
      expect(response).to redirect_to(challenges_url)
    end
  end

  describe 'POST /:challenge_id/upvote' do
    it 'creates a new Vote' do
      expect {
        post upvote_challenge_url(challenge)
      }.to change(Vote, :count).by(1)
    end
  end

  describe 'POST /:challenge_id/collaborate' do
    it 'creates a new Collaboration' do
      expect {
        post collaborate_challenge_url(challenge)
      }.to change(Collaboration, :count).by(1)
    end
  end
end
