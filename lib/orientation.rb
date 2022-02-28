class Orientation
  NORTH = 'N'.freeze
  EAST = 'E'.freeze
  SOUTH = 'S'.freeze
  WEST = 'W'.freeze
  TYPES = [NORTH, EAST, SOUTH, WEST].freeze

  attr_reader :current_orientation

  def initialize(direction:, current_orientation:)
    @direction = direction
    @current_orientation = current_orientation
  end

  def north
    NORTH
  end

  def east
    EAST
  end

  def south
    SOUTH
  end

  def west
    WEST
  end

  def valid?(new_orientation)
    TYPES.include?(new_orientation)
  end

  def turn(direction)
    if direction == @direction.left
      turn_left
    elsif direction == @direction.right
      turn_right
    end
  end

  private

  def turn_left
    new_orientation = {
      NORTH => WEST,
      WEST => SOUTH,
      SOUTH => EAST,
      EAST => NORTH
    }

    @current_orientation = new_orientation[@current_orientation]
  end

  def turn_right
    new_orientation = {
      NORTH => EAST,
      EAST => SOUTH,
      SOUTH => WEST,
      WEST => NORTH
    }

    @current_orientation = new_orientation[@current_orientation]
  end
end
