require 'robot'
require 'coordinates_generator'
require 'grid'
require 'orientation'
require 'direction'
require 'move'

describe 'Robot' do
  subject do
    Robot.new(
      grid: grid,
      orientation: orientation,
      x_axis: x_axis,
      y_axis: y_axis,
      direction: direction,
      move: move
    )
  end

  let(:coordinates) do
    CoordinatesGenerator.generate(
      max_x_axis_value: 2,
      max_y_axis_value: 3
    )
  end

  let(:grid) { Grid.new(coordinates: coordinates) }
  let(:direction) { Direction }
  let(:orientation) { Orientation.new(direction: Direction, current_orientation: 'N') }
  let(:x_axis) { 1 }
  let(:y_axis) { 2 }
  let(:current_position) { coordinates[[x_axis, y_axis]] }
  let(:move) { Move.new(grid: grid, orientation: orientation, current_position: current_position) }

  describe 'respond_to_direction' do
    describe 'current position' do
      it 'sets the current position' do
        expect(subject.current_position).not_to be nil
        expect(subject.current_position.x_axis).to eq(x_axis)
        expect(subject.current_position.y_axis).to eq(y_axis)
      end
    end

    describe 'orientation' do
      it 'updates the current orientation when the direction is right' do
        subject.respond_to_direction(new_direction: direction.right)

        expect(subject.current_orientation).to eq(orientation.east)
      end

      it 'updates the current orientation when the direction is left' do
        subject.respond_to_direction(new_direction: direction.left)

        expect(subject.current_orientation).to eq(orientation.west)
      end

      it 'does not update the current orientation when the direction is not left or right' do
        subject.respond_to_direction(new_direction: direction.forward)

        expect(subject.current_orientation).to eq(orientation.north)
      end
    end

    describe 'position' do
      it 'updates the current position when the direction is forward' do
        subject.respond_to_direction(new_direction: direction.forward)

        expect(subject.current_position).not_to eq(current_position)
      end

      it 'does not update the current position when the direction is right' do
        subject.respond_to_direction(new_direction: direction.right)

        expect(subject.current_position).to eq(current_position)
      end

      it 'does not update the current position when the direction is left' do
        subject.respond_to_direction(new_direction: direction.left)

        expect(subject.current_position).to eq(current_position)
      end
    end

    describe 'lost' do
      let(:x_axis) { 2 }
      let(:y_axis) { 3 }

      it 'sets lost to true when the current and new positions are equal' do
        subject.respond_to_direction(new_direction: direction.forward)

        expect(subject.lost).to be true
      end

      it 'sets the scent to true at the current position' do
        subject.respond_to_direction(new_direction: direction.forward)

        expect(current_position.scent).to be true
      end
    end

    describe 'report location' do
      let(:x_axis) { 2 }
      let(:y_axis) { 3 }

      it 'returns the current location' do
        expect(subject.respond_to_direction(new_direction: direction.right)).to eq('2 3 E')
      end

      it 'returns the last known location when lost' do
        expect(subject.respond_to_direction(new_direction: direction.forward)).to eq('2 3 N LOST')
      end
    end
  end
end
