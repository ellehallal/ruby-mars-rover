class Coordinate
  attr_reader :x_axis, :y_axis

  def initialize(x_axis:, y_axis:)
    @x_axis = x_axis
    @y_axis = y_axis
    @scent = false
  end

  def set_scent
    @scent = true
  end

  def scent?
    @scent
  end
end
