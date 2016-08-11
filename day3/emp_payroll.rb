
module Hourly
    def hourly_pay hourly_rate, hours_worked
        hourly_rate * hours_worked
    end 
end 

module Salaried
    def salaried_pay annual_rate
        annual_rate / 52.0
    end
end


class Employee

    attr_reader :name, :email

    def initialize(name, email)
        @name = name
        @email = email
    end

end

class HourlyEmployee < Employee
    include Hourly

    def initialize(name, email, hourly_rate, hours_worked)
        super(name, email)
        @hourly_rate = hourly_rate
        @hours_worked = hours_worked
        @weekly_salary = 0

    end

    def calculate_salary

        @weekly_salary = hourly_pay @hourly_rate, @hours_worked
    end


end

class SalariedEmployee < Employee

    include Salaried

    def initialize(name, email, annual_rate)
        super(name, email)
        @annual_rate = annual_rate
    end

    def calculate_salary
        salaried_pay @annual_rate
    end

end

class MultiPaymentEmployee < Employee

    include Salaried
    include Hourly

    def initialize(name, email, annual_rate, hourly_rate, hours_worked)
        super(name, email)
        @annual_rate = annual_rate
        @hourly_rate = hourly_rate
        @hours_worked = hours_worked
    end

    def calculate_salary
        
        weekly_salary = salaried_pay @annual_rate 
        overtime = @hours_worked - 40

        if overtime > 40 
             hourly_salary =  hourly_pay @hourly_rate , @hours_worked
        end
        

        weekly_salary + hourly_salary

    end

end






josh = HourlyEmployee.new('Josh', 'nachoemail@example.com', 35, 50)
nizar = SalariedEmployee.new('Nizar', 'starcraftrulez@gmail.com', 1000000)
ted = MultiPaymentEmployee.new('Ted', 'fortranr0x@gmail.com', 60000, 275, 55)

puts josh.calculate_salary
puts nizar.calculate_salary
puts ted.calculate_salary






