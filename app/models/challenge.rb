class Challenge < ApplicationRecord
  belongs_to :employee

  validates :title, :description, presence: true
end
