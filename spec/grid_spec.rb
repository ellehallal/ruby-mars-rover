require 'grid'

describe 'Grid' do
  let(:all_coordinates) { get_coordinates(x_axis: 2, y_axis: 3) }
  let(:grid) { Grid.new(coordinates: all_coordinates) }
  let(:within_bounds_values) { [1, 2] }
  let(:out_of_bounds_values) { [9, 10] }

  describe 'locate coordinate' do
    it 'returns the coordinate when it exists' do
      coordinate = grid.get_coordinate(within_bounds_values)

      expect(coordinate.x_axis).to eq(within_bounds_values[0])
      expect(coordinate.y_axis).to eq(within_bounds_values[1])
    end

    it 'returns nil when the coordinate does not exist' do
      coordinate = grid.get_coordinate(out_of_bounds_values)

      expect(coordinate).to be nil
    end
  end

  describe 'scent?' do
    let(:coordinate_within_bounds) { all_coordinates[within_bounds_values] }
    let(:coordinate_out_of_bounds) { all_coordinates[out_of_bounds_values] }

    it 'returns true when the coordinate has a scent' do
      coordinate_within_bounds.set_scent

      expect(grid.scent?(coordinate_within_bounds)).to be true
    end

    it 'returns false when the coordinate does not have a scent' do
      expect(grid.scent?(coordinate_within_bounds)).to be false
    end

    it 'returns false when the coordinate does not exist' do
      expect(grid.scent?(coordinate_out_of_bounds)).to be false
    end
  end

  describe 'within_bounds?' do
    it 'returns true when an existing coordinate with the values exists' do
      expect(grid.within_bounds?(within_bounds_values)).to be true
    end

    it 'returns true when an existing coordinate with the values does not exist ' do
      expect(grid.within_bounds?(out_of_bounds_values)).to be false
    end
  end
end
