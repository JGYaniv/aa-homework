require_relative "./employee.rb"

class Startup
    attr_reader :name, :funding, :salaries, :employees

    def initialize(name, funding, salaries)
        @name = name
        @funding = funding
        @salaries = salaries
        @employees = []
    end

    def valid_title?(title)
        salaries.has_key?(title)
    end

    def >(other_startup)
        funding > other_startup.funding
    end

    def hire(employee_name, title)
        if !salaries.has_key?(title)
            raise "not a valid title"
        else
            @employees << Employee.new(employee_name, title)
        end
    end

    def size
        employees.length
    end

    def pay_employee(employee)
        if funding > salaries[employee.title]
            @funding -= salaries[employee.title]
            employee.pay(salaries[employee.title])
        else
            raise "not enough money"
        end
    end

    def payday
        employees.each {|employee| pay_employee(employee)}
    end

    def average_salary
        payroll = employees.map {|employee| salaries[employee.title]}
        total_payroll = payroll.sum
        total_employees = employees.length
        total_payroll / total_employees
    end

    def close
        @employees = []
        @salaries = {}
        @funding = 0
    end

    def acquire(other_startup)
        @funding += other_startup.funding
        @employees += other_startup.employees
        new_salaries = other_startup.salaries
        @salaries.each {|title, amount| new_salaries[title] = amount}
        @salaries = new_salaries
        other_startup.close 
    end
end
