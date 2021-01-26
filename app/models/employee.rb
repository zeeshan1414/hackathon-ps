class Employee < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :rememberable, :authentication_keys => [:employee_id]

  validates :employee_id, :password, presence: true

  has_many :collaborations, dependent: :destroy
  has_many :challenges, through: :collaborations
  has_many :votes, through: :challenges
end
