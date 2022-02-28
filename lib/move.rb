class Move
  def initialize(orientation:, grid:, current_position:)
    @orientation = orientation
    @grid = grid
    @current_position = current_position
  end

  def to_position
    values = calculate_new_coordinate_values(
      x_axis: @current_position.x_axis,
      y_axis: @current_position.y_axis
    )

    get_new_coordinate(values)
  end

  private

  def calculate_new_coordinate_values(x_axis:, y_axis:)
    values = {
      @orientation.north => [x_axis, y_axis + 1],
      @orientation.south => [x_axis, y_axis - 1],
      @orientation.east => [x_axis + 1, y_axis],
      @orientation.west => [x_axis - 1, y_axis]
    }

    values[@orientation.current_orientation]
  end

  def get_new_coordinate(values)
    @grid.locate_coordinate(values) || @current_position
  end
end
