require 'direction'

describe 'Direction' do
  let(:right) { 'R' }
  let(:left) { 'L' }
  let(:forward) { 'F' }

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
end
