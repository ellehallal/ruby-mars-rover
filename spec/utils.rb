require 'coordinates_generator'

module Utils
  def get_coordinates(x_axis:, y_axis:)
    CoordinatesGenerator.generate(
      max_x_axis_value: x_axis,
      max_y_axis_value: y_axis
    )
  end

  def north_orientation
    'N'
  end

  def south_orientation
    'S'
  end

  def east_orientation
    'E'
  end

  def west_orientation
    'W'
  end

  def right_direction
    'R'
  end

  def left_direction
    'L'
  end

  def forward_direction
    'F'
  end
end
