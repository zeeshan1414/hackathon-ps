class Challenge < ApplicationRecord
  belongs_to :employee
  belongs_to :tag

  validates :title, :description, presence: true

  has_many :collaborations, dependent: :destroy
  has_many :employees, through: :collaborations
  has_many :votes, dependent: :destroy

  def self.sort(param)
    case param
    when 'created_at'
      Challenge.order(param)
    when 'votes'
      Challenge.left_joins(:votes).group("challenges.id").order("count(challenges.id) DESC")
    else
      Challenge.all
    end
  end
end
