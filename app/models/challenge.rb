class Challenge < ApplicationRecord
  belongs_to :employee
  belongs_to :tag

  validates :title, :description, presence: true

  has_many :collaborations, dependent: :destroy
  has_many :employees, through: :collaborations
  has_many :votes, dependent: :destroy

  scope :created_by, ->(emp_id) { where(employee_id: emp_id) }
end
