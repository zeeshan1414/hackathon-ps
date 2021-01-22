class Tag < ApplicationRecord
  has_many :challenges, dependent: :destroy

  validates :name, presence: true
end
