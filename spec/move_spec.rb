require 'move'
require 'orientation'
require 'direction'
require 'coordinates_generator'
require 'coordinate'
require 'grid'

describe 'Move' do
  let(:all_coordinates) do
    CoordinatesGenerator.generate(
      max_x_axis_value: 2,
      max_y_axis_value: 3
    )
  end

  let(:current_x_axis) { 1 }
  let(:current_y_axis) { 2 }
  let(:current_position) { all_coordinates[[current_x_axis, current_y_axis]] }
  let(:direction) { Direction }
  let(:orientation) { Orientation.new(direction: direction, current_orientation: current_orientation) }
  let(:grid) { Grid.new(coordinates: all_coordinates) }

  subject do
    Move.new(
      grid: grid,
      orientation: orientation,
      current_position: current_position
    )
  end

  describe 'north orientation' do
    let(:current_orientation) { 'N' }

    it 'returns the updated position where y_axis increases by 1' do
      position = subject.to_position

      expect(position.x_axis).to eq(current_x_axis)
      expect(position.y_axis).to eq(current_y_axis + 1)
    end
  end

  describe 'south orientation' do
    let(:current_orientation) { 'S' }

    it 'returns the updated position where y_axis decreases by 1' do
      position = subject.to_position

      expect(position.x_axis).to eq(current_x_axis)
      expect(position.y_axis).to eq(current_y_axis - 1)
    end
  end

  describe 'east orientation' do
    let(:current_orientation) { 'E' }

    it 'returns the updated position where x_axis increases by 1' do
      position = subject.to_position

      expect(position.x_axis).to eq(current_x_axis + 1)
      expect(position.y_axis).to eq(current_y_axis)
    end
  end

  describe 'west orientation' do
    let(:current_orientation) { 'W' }

    it 'returns the updated position where x_axis decreases by 1' do
      position = subject.to_position

      expect(position.x_axis).to eq(current_x_axis - 1)
      expect(position.y_axis).to eq(current_y_axis)
    end
  end

  describe 'position does not exist' do
    let(:current_orientation) { 'N' }
    let(:current_x_axis) { 2 }
    let(:current_y_axis) { 3 }

    it 'returns the current position' do
      position = subject.to_position

      expect(position.x_axis).to eq(current_x_axis)
      expect(position.y_axis).to eq(current_y_axis)
    end
  end
end
