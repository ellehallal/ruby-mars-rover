require 'coordinate'

describe 'Coordinate' do
  it 'sets scent to true' do
    coordinate = Coordinate.new(x_axis: 1, y_axis: 2)

    coordinate.set_scent

    expect(coordinate.scent?).to be true
  end
end
