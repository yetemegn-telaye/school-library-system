class Person
    def initialize(age, name = "Unknown", parent_permission = true)
        @name = name
        @age = age
        @id = id
        @parent_permission = parent_permission
    end
    attr_accessor :id,:name,:age
    attr_writer :name, :age
    def is_of_age?
        @age >= 18
    end
    def can_use_services?
        is_of_age? || @parent_permission
    end
end