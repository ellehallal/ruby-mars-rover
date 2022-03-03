class Move
  class << self
    def to_position(orientation:, grid:, current_position:)
      values = calculate_new_coordinate_values(
        x_axis: current_position.x_axis,
        y_axis: current_position.y_axis,
        orientation: orientation
      )

      get_new_coordinate(values: values, current_position: current_position, grid: grid)
    end

    private

    def calculate_new_coordinate_values(x_axis:, y_axis:, orientation:)
      values = {
        orientation.north => [x_axis, y_axis + 1],
        orientation.south => [x_axis, y_axis - 1],
        orientation.east => [x_axis + 1, y_axis],
        orientation.west => [x_axis - 1, y_axis]
      }

      values[orientation.current_orientation]
    end

    def get_new_coordinate(values:, current_position:, grid:)
      grid.locate_coordinate(values) || current_position
    end
  end
end
