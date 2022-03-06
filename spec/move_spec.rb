require 'move'
require 'orientation'
require 'direction'
require 'coordinates_generator'
require 'coordinate'
require 'grid'

describe 'Move' do
  subject(:to_position) { Move.to_position(orientation: orientation, grid: grid, current_position: current_coordinate) }

  let(:all_coordinates) { get_coordinates(x_axis: 2, y_axis: 3) }
  let(:grid) { Grid.new(coordinates: all_coordinates) }
  let(:direction) { Direction }
  let(:current_x_axis) { 1 }
  let(:current_y_axis) { 2 }
  let(:current_coordinate) { all_coordinates[[current_x_axis, current_y_axis]] }
  let(:orientation) { Orientation.new(direction: direction, current_orientation: current_orientation) }

  describe 'new position exists and current position has no scent' do
    describe 'north orientation' do
      let(:current_orientation) { north_orientation }

      it 'returns the updated position where y_axis increases by 1' do
        expect(to_position[:position].x_axis).to eq(current_x_axis)
        expect(to_position[:position].y_axis).to eq(current_y_axis + 1)
      end
    end

    describe 'south orientation' do
      let(:current_orientation) { south_orientation }

      it 'returns the updated position where y_axis decreases by 1' do
        expect(to_position[:position].x_axis).to eq(current_x_axis)
        expect(to_position[:position].y_axis).to eq(current_y_axis - 1)
      end
    end

    describe 'east orientation' do
      let(:current_orientation) { east_orientation }

      it 'returns the updated position where x_axis increases by 1' do
        expect(to_position[:position].x_axis).to eq(current_x_axis + 1)
        expect(to_position[:position].y_axis).to eq(current_y_axis)
      end
    end

    describe 'west orientation' do
      let(:current_orientation) { west_orientation }

      it 'returns the updated position where x_axis decreases by 1' do
        expect(to_position[:position].x_axis).to eq(current_x_axis - 1)
        expect(to_position[:position].y_axis).to eq(current_y_axis)
      end
    end
  end

  describe 'new position does not exist and current position has no scent' do
    let(:current_orientation) { north_orientation }
    let(:current_x_axis) { 2 }
    let(:current_y_axis) { 3 }

    it 'returns the current position' do
      expect(to_position[:position].x_axis).to eq(current_x_axis)
      expect(to_position[:position].y_axis).to eq(current_y_axis)
    end

    it 'returns the lost status as true' do
      expect(to_position[:lost]).to eq(true)
    end
  end

  describe 'new position exists and current position has a scent' do
    let(:current_orientation) { west_orientation }
    let(:current_x_axis) { 2 }
    let(:current_y_axis) { 3 }

    it 'returns the new position' do
      current_coordinate.set_scent

      expect(to_position[:position]).not_to eq(current_coordinate)
      expect(to_position[:position].y_axis).not_to be nil
    end

    it 'returns the lost status as false' do
      current_coordinate.set_scent

      expect(to_position[:lost]).to eq(false)
    end
  end

  describe 'new position does not exist and current position has a scent' do
    let(:current_orientation) { north_orientation }
    let(:current_x_axis) { 2 }
    let(:current_y_axis) { 3 }

    it 'returns the current position' do
      current_coordinate.set_scent

      expect(to_position[:position]).to eq(current_coordinate)
    end

    it 'returns the lost status as false' do
      current_coordinate.set_scent

      expect(to_position[:lost]).to eq(false)
    end
  end
end
