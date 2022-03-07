require_relative './mars_rover'
require_relative './input_reader'

file_path = "#{Dir.pwd}/lib/input.txt"
MarsRover.start(file_path)
