class Challenge < ApplicationRecord
  belongs_to :employee
  belongs_to :tag

  validates :title, :description, presence: true
end
