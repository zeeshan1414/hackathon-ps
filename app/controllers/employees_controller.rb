class EmployeesController < ApplicationController
  before_action :find_employee

  def show
  end

  def challenges
    @pagy, @challenges = pagy(Challenge.created_by(@employee).includes(:tag, :employees), items: 5)
  end

  def collaborations
    @pagy, @challenges = pagy(@employee.challenges.includes(:tag, :employees), items: 5)
  end

  private

  def find_employee
    @employee = Employee.find(params[:id])
  end
end
