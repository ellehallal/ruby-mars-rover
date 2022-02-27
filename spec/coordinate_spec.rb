require 'coordinate'

describe 'Coordinate' do
  it 'sets scent to true' do
    coordinate = Coordinate.new(1,2)

    coordinate.set_scent

    expect(coordinate.scent).to be true
  end
end