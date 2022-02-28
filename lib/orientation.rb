class Orientation
  NORTH = 'N'.freeze
  EAST = 'E'.freeze
  SOUTH = 'S'.freeze
  WEST = 'W'.freeze
  TYPES = [NORTH, EAST, SOUTH, WEST].freeze

  attr_reader :current

  def initialize(direction:, current:)
    @direction = direction
    @current = current
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

    @current = new_orientation[@current]
  end

  def turn_right
    new_orientation = {
      NORTH => EAST,
      EAST => SOUTH,
      SOUTH => WEST,
      WEST => NORTH
    }

    @current = new_orientation[@current]
  end
end
