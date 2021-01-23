class Challenge < ApplicationRecord
  belongs_to :employee
  belongs_to :tag

  has_many :collaborators, class_name: 'Employee', 
  foreign_key: :employee_id, dependent: :destroy

  validates :title, :description, presence: true
end
