require 'output'

describe 'Output' do
  before { allow($stdout).to receive(:puts) }

  it 'calls $stdout.puts with the text' do
    text = '23E'

    Output.print(text)

    expect($stdout).to have_received(:puts).with(text)
  end
end
