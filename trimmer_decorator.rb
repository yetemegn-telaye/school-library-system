require './decorator'

class TrimDecorator < Decorator
  def correct_name
    @nameable.correct_name[0...10]
  end
end
