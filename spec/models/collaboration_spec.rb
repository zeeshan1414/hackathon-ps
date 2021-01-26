require 'rails_helper'

RSpec.describe Collaboration, type: :model do
  let(:collaboration) { build(:collaboration) }

  context 'Associations' do
    it { expect(collaboration).to belong_to(:employee) }
    it { expect(collaboration).to belong_to(:challenge) }
  end
end
