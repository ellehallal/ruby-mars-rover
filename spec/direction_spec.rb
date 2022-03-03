require 'direction'

describe 'Direction' do
  let(:right) { right_direction }
  let(:left) { left_direction }
  let(:forward) { forward_direction }

  it 'returns the right direction' do
    expect(Direction.right).to eq(right)
  end

  it 'returns the left direction' do
    expect(Direction.left).to eq(left)
  end

  it 'returns the forward direction' do
    expect(Direction.forward).to eq(forward)
  end

  it 'returns true when the direction is valid' do
    expect(Direction.valid?(left)).to be true
    expect(Direction.valid?(right)).to be true
    expect(Direction.valid?(forward)).to be true
  end

  it 'returns false when the direction is invalid' do
    invalid_direction = 'D'

    expect(Direction.valid?(invalid_direction)).to be false
  end

  describe 'turn' do
    it 'returns true when the direction is a turn direction' do
      expect(Direction.turn?(right)).to be true
      expect(Direction.turn?(left)).to be true
    end

    it 'returns false when the direction is not a turn direction' do
      expect(Direction.turn?(forward)).to be false
    end
  end

  describe 'move' do
    it 'returns true when the direction is a move direction' do
      expect(Direction.move?(forward)).to be true
    end

    it 'returns false when the direction is not a move direction' do
      expect(Direction.move?(right)).to be false
      expect(Direction.move?(left)).to be false
    end
  end
end
