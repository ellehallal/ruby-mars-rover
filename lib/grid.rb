class Grid
  attr_reader :coordinates

  def initialize(coordinates:)
    @coordinates = coordinates
  end

  def locate_coordinate(values)
    @coordinates[values]
  end

  def scent?(coordinate)
    values = [coordinate&.x_axis, coordinate&.y_axis]

    locate_coordinate(values)&.scent? || false
  end

  def within_bounds?(values)
    !locate_coordinate(values).nil?
  end
end
