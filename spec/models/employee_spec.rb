require 'rails_helper'

RSpec.describe Employee, type: :model do
  let(:employee) { build(:employee) }

  context 'Validations' do
    it 'has a employee_id' do
      employee.employee_id = ''
      expect(employee).to_not be_valid
      
      employee.employee_id = 'emp_101'
      expect(employee).to be_valid
    end

    it 'has a password' do
      employee.password = ''
      expect(employee).to_not be_valid

      employee.password = Faker::Internet.password
      expect(employee).to be_valid
    end
  end

  context 'Associations' do
    it { expect(employee).to have_many(:challenges) }
    it { expect(employee).to have_many(:votes) }
  end

end
