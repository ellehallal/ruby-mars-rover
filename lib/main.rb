require_relative './mars_rover'
require_relative './grid'
require_relative './coordinates_generator'

coordinates = CoordinatesGenerator.generate(
  max_x_axis_value: 5,
  max_y_axis_value: 3
)
grid = Grid.new(coordinates: coordinates)
MarsRover.new(grid: grid)
