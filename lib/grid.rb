class Grid
  attr_reader :coordinates

  def initialize(coordinates:)
    @coordinates = coordinates
  end

  def get_coordinate(values)
    @coordinates[values]
  end

  def scent?(coordinate)
    values = [coordinate&.x_axis, coordinate&.y_axis]

    get_coordinate(values)&.scent? || false
  end

  def within_bounds?(values)
    !get_coordinate(values).nil?
  end
end
