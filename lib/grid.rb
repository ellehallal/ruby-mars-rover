class Grid
  attr_reader :coordinates

  def initialize(coordinates:)
    @coordinates = coordinates
  end

  def locate_coordinate(values:)
    @coordinates[values]
  end
end
