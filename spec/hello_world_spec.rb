require 'hello_world'

describe 'HelloWorld' do
  it 'returns hello world' do
    hello_world = HelloWorld.new

    expect(hello_world.greet).to eq('Hello World')
  end
end
