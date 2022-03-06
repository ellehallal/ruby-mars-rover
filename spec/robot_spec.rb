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

  let(:coordinates) { get_coordinates(x_axis: 2, y_axis: 3) }
  let(:grid) { Grid.new(coordinates: coordinates) }
  let(:direction) { Direction }
  let(:starting_orientation) { north_orientation }
  let(:orientation) { Orientation.new(direction: Direction, current_orientation: starting_orientation) }
  let(:x_axis) { 1 }
  let(:y_axis) { 2 }
  let(:move) { Move }

  describe 'respond_to_commands' do
    describe 'current position' do
      it 'sets the current position' do
        expect(subject.current_position).not_to be nil
        expect(subject.current_position.x_axis).to eq(x_axis)
        expect(subject.current_position.y_axis).to eq(y_axis)
      end
    end

    describe 'orientation' do
      it 'updates the current orientation when the direction is right' do
        subject.respond_to_commands([right_direction])

        expect(subject.current_orientation).to eq(orientation.east)
      end

      it 'updates the current orientation when the direction is left' do
        subject.respond_to_commands([left_direction])

        expect(subject.current_orientation).to eq(orientation.west)
      end

      it 'does not update the current orientation when the direction is not left or right' do
        subject.respond_to_commands([forward_direction])

        expect(subject.current_orientation).to eq(starting_orientation)
      end
    end

    describe 'position' do
      let(:starting_position) { coordinates[[x_axis, y_axis]] }

      it 'updates the current position when the direction is forward' do
        subject.respond_to_commands([forward_direction])

        expect(subject.current_position).not_to eq(starting_position)
      end

      it 'does not update the current position when the direction is right' do
        subject.respond_to_commands([right_direction])

        expect(subject.current_position).to eq(starting_position)
      end

      it 'does not update the current position when the direction is left' do
        subject.respond_to_commands([left_direction])

        expect(subject.current_position).to eq(starting_position)
      end
    end

    describe 'multiple directions' do
      let(:starting_position) { coordinates[[x_axis, y_axis]] }

      it 'responds to multiple directions' do
        subject.respond_to_commands(
          [
            forward_direction,
            right_direction,
            forward_direction,
            left_direction,
            left_direction
          ]
        )

        expect(subject.current_position).not_to eq(starting_position)
        expect(subject.current_orientation).not_to eq(starting_orientation)
      end
    end

    describe 'lost' do
      let(:x_axis) { 2 }
      let(:y_axis) { 3 }

      it 'sets lost to true when the current and new positions are equal' do
        subject.respond_to_commands([forward_direction])

        expect(subject.lost).to be true
      end

      it 'sets the scent to true at the current position' do
        subject.respond_to_commands([forward_direction])

        expect(subject.current_position.scent?).to be true
      end

      it 'does not update the position when lost is true' do
        subject.respond_to_commands([forward_direction])
        last_position = subject.current_position
        subject.respond_to_commands([forward_direction])

        expect(subject.current_position).to eq(last_position)
      end

      it 'does not update the orientation when lost is true' do
        subject.respond_to_commands([forward_direction])
        last_orientatation = subject.current_orientation
        subject.respond_to_commands([left_direction])

        expect(subject.current_orientation).to eq(last_orientatation)
      end
    end

    describe 'report location' do
      let(:x_axis) { 2 }
      let(:y_axis) { 3 }

      it 'returns the current location' do
        expect(subject.respond_to_commands([right_direction])).to eq('2 3 E')
      end

      it 'returns the last known location when lost' do
        expect(subject.respond_to_commands([forward_direction])).to eq('2 3 N LOST')
      end
    end
  end
end
