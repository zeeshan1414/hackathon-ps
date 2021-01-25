require 'rails_helper'

RSpec.describe Vote, type: :model do
  let(:vote) { build(:vote) }
  context 'Associations' do
    it { expect(vote).to belong_to(:employee) }
    it { expect(vote).to belong_to(:challenge) }
  end
end
