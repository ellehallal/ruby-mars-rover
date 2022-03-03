require 'grid'

describe 'Grid' do
  let(:all_coordinates) { get_coordinates(x_axis: 2, y_axis: 3) }

  it 'returns the coordinate when it exists' do
    grid = Grid.new(coordinates: all_coordinates)
    x_axis = 1
    y_axis = 2
    values = [x_axis, y_axis]

    coordinate = grid.locate_coordinate(values)

    expect(coordinate.x_axis).to eq(x_axis)
    expect(coordinate.y_axis).to eq(y_axis)
  end

  it 'returns nil when the coordinate does not exist' do
    grid = Grid.new(coordinates: all_coordinates)
    x_axis = 9
    y_axis = 10
    values = [x_axis, y_axis]

    coordinate = grid.locate_coordinate(values)

    expect(coordinate).to be nil
  end
end
