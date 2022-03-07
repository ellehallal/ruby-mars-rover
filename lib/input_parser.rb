class InputParser
  def initialize(input)
    @input = split(input)
  end

  def grid_size
    chars = @input.first.chars

    {
      x_axis: chars[0].to_i,
      y_axis: chars[1].to_i
    }
  end

  def instructions
    input_copy = @input.drop(1)

    input_copy.each_slice(2).map do |starting_position, commands|
      coordinate_values = format_coordinate_values(starting_position)
      orientation = format_orientation(starting_position)
      commands = format_commands(commands)

      coordinate_values.merge(orientation).merge(commands)
    end
  end

  private

  def split(input)
    input.split
  end

  def format_coordinate_values(starting_position)
    chars = starting_position.chars
    {
      x_axis: chars[0].to_i,
      y_axis: chars[1].to_i
    }
  end

  def format_orientation(starting_position)
    { orientation: starting_position.chars[2] }
  end

  def format_commands(commands)
    { commands: commands.chars }
  end
end
