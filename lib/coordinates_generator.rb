require_relative './coordinate'

class CoordinatesGenerator
  class << self
    def generate(max_x_axis_value:, max_y_axis_value:)
      coordinates = {}
      all_coordinate_values = generate_coordinate_values(
        max_x_axis_value,
        max_y_axis_value
      )

      all_coordinate_values.each do |position|
        add_coordinate(coordinates, position)
      end

      coordinates
    end

    private

    def axis_values(axis_max_value)
      (0..axis_max_value).to_a
    end

    def generate_coordinate_values(max_x_axis_value, max_y_axis_value)
      x_axis_values = axis_values(max_x_axis_value)
      y_axis_values = axis_values(max_y_axis_value)

      x_axis_values.product(y_axis_values)
    end

    def add_coordinate(coordinates, position)
      x_axis = position[0]
      y_axis = position[1]

      coordinates[position] = Coordinate.new(x_axis: x_axis, y_axis: y_axis)
    end
  end
end
