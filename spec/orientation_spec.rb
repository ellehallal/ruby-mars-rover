require 'orientation'
require 'direction'

describe 'Orientation' do
  let(:north) { 'N' }
  let(:east) { 'E' }
  let(:south) { 'S' }
  let(:west) { 'W' }

  describe 'valid?' do
    subject { Orientation.new(direction: Direction, current: west) }

    it('returns true when the orientation is valid') do
      expect(subject.valid?(north)).to be true
      expect(subject.valid?(south)).to be true
      expect(subject.valid?(east)).to be true
      expect(subject.valid?(west)).to be true
    end

    it('returns false when the orientation is invalid') do
      invalid_orientation = 'NW'

      expect(subject.valid?(invalid_orientation)).to be false
    end
  end

  describe 'turn' do
    let(:direction) { Direction }

    describe 'left' do
      let(:left) { 'L' }

      it 'changes the current orientation from north to west' do
        orientation = Orientation.new(
          direction: Direction,
          current: north
        )

        orientation.turn(left)

        expect(orientation.current).to eq(west)
      end

      it 'changes the current orientation from west to south' do
        orientation = Orientation.new(
          direction: Direction,
          current: west
        )

        orientation.turn(left)

        expect(orientation.current).to eq(south)
      end

      it 'changes the current orientation from south to east' do
        orientation = Orientation.new(
          direction: Direction,
          current: south
        )

        orientation.turn(left)

        expect(orientation.current).to eq(east)
      end

      it 'changes the current orientation from east to north' do
        orientation = Orientation.new(
          direction: Direction,
          current: east
        )

        orientation.turn(left)

        expect(orientation.current).to eq(north)
      end
    end

    describe 'right' do
      let(:right) { 'R' }

      it 'changes the current orientation from north to east' do
        orientation = Orientation.new(
          direction: Direction,
          current: north
        )

        orientation.turn(right)

        expect(orientation.current).to eq(east)
      end

      it 'changes the current orientation from east to south' do
        orientation = Orientation.new(
          direction: Direction,
          current: east
        )

        orientation.turn(right)

        expect(orientation.current).to eq(south)
      end

      it 'changes the current orientation from south to west' do
        orientation = Orientation.new(
          direction: Direction,
          current: south
        )

        orientation.turn(right)

        expect(orientation.current).to eq(west)
      end

      it 'changes the current orientation from west to north' do
        orientation = Orientation.new(
          direction: Direction,
          current: west
        )

        orientation.turn(right)

        expect(orientation.current).to eq(north)
      end
    end

    describe 'forward' do
      let(:forward) { 'F' }

      it 'does not change the currengt orientation' do
        orientation = Orientation.new(
          direction: Direction,
          current: north
        )

        orientation.turn(forward)

        expect(orientation.current).to eq(north)
      end
    end
  end
end
