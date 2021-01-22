require 'rails_helper'

RSpec.describe Challenge, type: :model do
  let(:challenge) { build(:challenge) }

  context 'Validations' do
    it 'has a title' do
      challenge.title = ''
      expect(challenge).to_not be_valid

      challenge.title = 'Something'
      expect(challenge).to be_valid
    end

    it 'has a description' do
      challenge.description = ''
      expect(challenge).to_not be_valid

      challenge.description = 'SOme Description'
      expect(challenge).to be_valid
    end

    it 'must have a employee_id' do
      challenge.employee = nil
      expect(challenge).to_not be_valid

      challenge.employee = create(:employee, employee_id: 'emp_201')
      expect(challenge).to be_valid
    end

    # it 'must have a tag' do
    #   challenge.tag_id = nil
    #   expect(challenge).to_not be_valid

    #   challenge.tag_id = 1
    #   expect(challenge).to be_valid
    # end
  end
end
