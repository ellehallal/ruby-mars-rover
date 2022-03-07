require 'input_parser'

describe 'InputParser' do
  let(:subject) { InputParser.new("53\n11E\nRFRFRFRF\n32N\nFRRFLLFFRRFLL\n03W\nLLFFFLFLFL") }

  it 'formats the grid size' do
    expect(subject.grid_size).to eq(
      {
        x_axis: 5,
        y_axis: 3
      }
    )
  end

  it 'formats the instructions' do
    expect(subject.instructions).to eq(
      [
        { x_axis: 1, y_axis: 1, orientation: 'E', commands: %w[R F R F R F R F] },
        { x_axis: 3, y_axis: 2, orientation: 'N', commands: %w[F R R F L L F F R R F L L] },
        { x_axis: 0, y_axis: 3, orientation: 'W', commands: %w[L L F F F L F L F L] }
      ]
    )
  end
end
