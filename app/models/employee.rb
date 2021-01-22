class Employee < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :rememberable, :authentication_keys => [:employee_id]

  validates :employee_id, :password, presence: true

  has_many :challenges, dependent: :destroy
end
