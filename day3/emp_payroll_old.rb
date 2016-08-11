class Employee

    attr_reader :name, :email

    def initialize(name, email)
        @name = name
        @email = email
    end

end

class HourlyEmployee < Employee
    def initialize(name, email, hourly_rate, hours_worked)
        @name = name
        @email = email
        @hourly_rate = hourly_rate
        @hours_worked = hours_worked
        @weekly_salary = 0

    end

    def calculate_salary
        @weekly_salary = @hours_worked * @hourly_rate
    end


end

class SalariedEmployee < Employee
    def initialize(name, email, annual_rate)
        @name = name
        @email = email
        @annual_rate = annual_rate
    end

    def calculate_salary
        @annual_rate / 52.0
    end

end

class MultiPaymentEmployee < Employee
    def initialize(name, email, annual_rate, hourly_rate, hours_worked)
        @name = name
        @email = email
        @annual_rate = annual_rate
        @hourly_rate = hourly_rate
        @hours_worked = hours_worked
    end

    def calculate_salary
        weekly_salary = @annual_rate / 52.0
        over_time = @hours_worked  - 40

        total_over_time_salary = over_time * @hourly_rate if @hours_worked > 40

        total_weekly_salary = weekly_salary + total_over_time_salary 

    end

end


josh = HourlyEmployee.new('Josh', 'nachoemail@example.com', 35, 50)
nizar = SalariedEmployee.new('Nizar', 'starcraftrulez@gmail.com', 1000000)
ted = MultiPaymentEmployee.new('Ted', 'fortranr0x@gmail.com', 60000, 275, 55)

puts josh.calculate_salary
puts nizar.calculate_salary
puts ted.calculate_salary




