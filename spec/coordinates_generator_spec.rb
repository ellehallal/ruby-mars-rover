require 'coordinates_generator'

describe 'CoordinatesGenerator' do
  it 'generates multiple Coordinates' do
    max_x_axis_value = 2
    max_y_axis_value = 3

    coordinates = CoordinatesGenerator.generate(
      max_x_axis_value: max_x_axis_value,
      max_y_axis_value: max_y_axis_value
    )
    selected_coordinate = coordinates[[1, 2]]

    expect(coordinates.count).to eq(12)
    expect(selected_coordinate).to be_an_instance_of(Coordinate)
    expect(selected_coordinate.x_axis).to eq(1)
    expect(selected_coordinate.y_axis).to eq(2)
  end

  it 'generates a single Coordinate' do
    max_x_axis_value = 0
    max_y_axis_value = 0

    coordinates = CoordinatesGenerator.generate(
      max_x_axis_value: max_x_axis_value,
      max_y_axis_value: max_y_axis_value
    )
    selected_coordinate = coordinates[[max_x_axis_value, max_y_axis_value]]

    expect(coordinates.count).to eq(1)
    expect(selected_coordinate).to be_an_instance_of(Coordinate)
    expect(selected_coordinate.x_axis).to eq(0)
    expect(selected_coordinate.y_axis).to eq(0)
  end
end
