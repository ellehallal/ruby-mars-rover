class Grid
  attr_reader :coordinates

  def initialize(coordinates:)
    @coordinates = coordinates
  end

  def locate_coordinate(values)
    @coordinates[values]
  end

  def scent?(values)
    locate_coordinate(values)&.scent? || false
  end
end
