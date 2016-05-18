require "byebug"

class Employee

  attr_reader :name, :title, :salary
  attr_accessor :boss

  def initialize(name, title, salary, boss = nil)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
  end

  def bonus(multiplier)
    @salary * multiplier
  end

  def inspect
    @name
  end

end


class Manager < Employee

  attr_accessor :employees

  def initialize(name, title, salary, boss = nil, employees = [])
    super(name, title, salary, boss)
    @employees = employees
  end

  def bonus(multiplier)
    subemployee.inject(0){ |accum, el| accum + el.salary } * multiplier
  end

  def subemployee
    subs = []
    @employees.each do |el|
      if el.is_a?(Manager)
        subs += el.subemployee
        subs << el
      else
        subs << el
      end
    end
    subs
  end

end

david = Employee.new("David", "TA", 10000)
shawna = Employee.new("Shawna", "TA", 12000)
darren = Manager.new("Darren", "TA Manager", 78000)
ned = Manager.new("Ned", "Founder", 1000000)

david.boss = darren
shawna.boss = darren
darren.boss = ned
darren.employees = [david, shawna]
ned.employees = [darren]

p ned.bonus(5)
p darren.bonus(4)
p david.bonus(3)
