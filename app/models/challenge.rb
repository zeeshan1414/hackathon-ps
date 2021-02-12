class Challenge < ApplicationRecord
  belongs_to :employee
  belongs_to :tag

  validates :title, :description, presence: true

  has_many :collaborations, dependent: :destroy
  has_many :employees, through: :collaborations
  has_many :votes, dependent: :destroy

  scope :created_by, ->(emp_id) { where(employee_id: emp_id) }

  def self.voted?(challenge_id:, employee_id:)
    Vote.exists?(challenge_id: challenge_id, employee_id: employee_id)
  end

  def self.collaborated?(challenge_id:, employee_id:)
    Collaboration.exists?(challenge_id: challenge_id, employee_id: employee_id)
  end
end
