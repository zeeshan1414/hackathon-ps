require 'rails_helper'

RSpec.describe Tag, type: :model do
  let(:tag) { build(:tag) }

  context 'Validations' do
    it 'has a name' do
      tag.name = ''
      expect(tag).to_not be_valid

      tag.name = 'someName'
      expect(tag).to be_valid
    end

    it 'should save successfully' do
      expect(tag.save).to eq(true)
    end
  end

  context 'Associations' do
    it { expect(tag).to have_many(:challenges) }
  end
end
