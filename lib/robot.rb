class Robot
  attr_reader :current_position, :lost

  def initialize(grid:, orientation:, x_axis:, y_axis:, direction:, move:)
    @lost = false
    @grid = grid
    @orientation = orientation
    @current_position = @grid.locate_coordinate([x_axis, y_axis])
    @direction = direction
    @move = move
  end

  def respond_to_commands(commands)
    commands.each do |direction|
      if !lost && Direction.turn?(direction)
        turn(direction)
      elsif !lost
        move_forward
        set_scent
      end
    end
  end

  def current_orientation
    @orientation.current_orientation
  end

  def report_location
    location = "#{@current_position.x_axis} #{current_position.y_axis} #{current_orientation}"

    if lost
      "#{location} LOST"
    else
      location
    end
  end

  private

  def turn(direction)
    @orientation.turn(direction)
  end

  def move_forward
    move = @move.to_position(
      orientation: @orientation,
      grid: @grid,
      current_position: @current_position
    )

    @current_position = move[:position]
    @lost = move[:lost]
  end

  def set_scent
    @current_position.set_scent if lost
  end
end
