class Robot
  attr_reader :current_position, :lost

  def initialize(grid:, orientation:, x_axis:, y_axis:, direction:, move:)
    @lost = false
    @grid = grid
    @orientation = orientation
    @current_position = @grid.locate_coordinate([x_axis, y_axis])
    @direction = direction
    @move = move.new(
      grid: @grid,
      orientation: @orientation,
      current_position: @current_position
    )
  end

  def respond_to_direction(new_direction:)
    if Direction.turn?(new_direction)
      turn(new_direction: new_direction)
    else
      move_forward
    end

    report_location
  end

  def current_orientation
    @orientation.current_orientation
  end

  private

  def turn(new_direction:)
    @orientation.turn(new_direction)
  end

  def move_forward
    new_position = @move.to_position

    if @current_position == new_position
      mark_as_lost
    else
      @current_position = new_position
    end
  end

  def mark_as_lost
    @lost = true
    @current_position.set_scent
  end

  def report_location
    location = "#{@current_position.x_axis} #{current_position.y_axis} #{current_orientation}"

    if lost
      "#{location} LOST"
    else
      location
    end
  end
end
