class Person
  def initialize(age, name = 'Unknown', parent_permission: true)
    @name = name
    @age = age
    @id = id
    @parent_permission = parent_permission
  end

  attr_reader :id
  attr_accessor :name, :age

  def of_age?
    @age >= 18
  end

  def can_use_services?
    is_of_age? || @parent_permission
  end
end
