require_relative './grid'
require_relative './robot'
require_relative './orientation'
require_relative './direction'
require_relative './move'
require_relative './coordinates_generator'
require_relative './input_reader'
require_relative './input_parser'
require_relative './output'

class MarsRover
  class << self
    def start(file_path)
      input_parser = create_input_parser(file_path)
      grid = create_grid(input_parser.grid_size)
      instructions = input_parser.instructions

      instructions.each do |instruction|
        robot = create_robot(instruction, grid)
        robot.respond_to_commands(instruction[:commands])
        robot.report_location
      end
    end

    private

    def create_input_parser(file_path)
      input = InputReader.read(file_path)
      InputParser.new(input)
    end

    def create_grid(grid_size)
      coordinates = CoordinatesGenerator.generate(
        max_x_axis_value: grid_size[:x_axis],
        max_y_axis_value: grid_size[:y_axis]
      )

      Grid.new(coordinates: coordinates)
    end

    def create_robot(instruction, grid)
      orientation = Orientation.new(
        direction: Direction,
        current_orientation: instruction[:orientation]
      )

      Robot.new(
        grid: grid,
        orientation: orientation,
        x_axis: instruction[:x_axis],
        y_axis: instruction[:y_axis],
        direction: Direction,
        move: Move,
        output: Output
      )
    end
  end
end
