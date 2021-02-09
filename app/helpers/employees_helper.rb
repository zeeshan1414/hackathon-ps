module EmployeesHelper
  def say_my_name(employee)
    if employee.id == current_employee.id
      return 'My'
    else
      return employee.first_name+"'s"
    end
  end
end
