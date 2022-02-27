class Coordinate
  attr_reader :x, :y, :scent
  attr_accessor :scent

  def initialize(x, y)
    @x = x
    @y = y
    @scent = false
  end

  def set_scent
    @scent = true
  end
end