require 'input_parser'

describe 'InputParser' do
  let(:subject) { InputParser.new('/path/to/file') }

  before do
    allow(File).to receive(:read).and_return("53\n11E\nRFRFRFRF\n32N\nFRRFLLFFRRFLL\n03W\nLLFFFLFLFL")
  end

  it 'parses the grid size' do
    expect(subject.grid_size).to eq(
      {
        x_axis: 5,
        y_axis: 3
      }
    )
  end

  it 'parses the instructions' do
    expect(subject.instructions).to eq(
      [
        { x_axis: 1, y_axis: 1, orientation: 'E', command: 'RFRFRFRF' },
        { x_axis: 3, y_axis: 2, orientation: 'N', command: 'FRRFLLFFRRFLL' },
        { x_axis: 0, y_axis: 3, orientation: 'W', command: 'LLFFFLFLFL' }
      ]
    )
  end
end
