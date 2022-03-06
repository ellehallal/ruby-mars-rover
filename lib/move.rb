class Move
  class << self
    def to_position(orientation:, grid:, current_position:)
      values = calculate_new_coordinate_values(
        x_axis: current_position.x_axis,
        y_axis: current_position.y_axis,
        orientation: orientation
      )

      get_move(new_values: values, current_position: current_position, grid: grid)
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

    def get_move(new_values:, current_position:, grid:)
      move = default_move(current_position)

      if (grid.scent?(current_position) && grid.within_bounds?(new_values)) || grid.within_bounds?(new_values)
        move[:position] = grid.locate_coordinate(new_values)
      elsif !grid.scent?(current_position) && !grid.within_bounds?(new_values)
        move[:lost] = true
      end

      move
    end

    def default_move(current_position)
      {
        position: current_position,
        lost: false
      }.clone
    end
  end
end
