class Direction
  RIGHT = 'R'.freeze
  LEFT = 'L'.freeze
  FORWARD = 'F'.freeze
  TYPES = [RIGHT, LEFT, FORWARD].freeze
  TURN_DIRECTIONS = [RIGHT, LEFT].freeze
  MOVE_DIRECTIONS = [FORWARD].freeze

  def self.right
    RIGHT
  end

  def self.left
    LEFT
  end

  def self.forward
    FORWARD
  end

  def self.turn?(direction)
    TURN_DIRECTIONS.include?(direction)
  end

  def self.move?(direction)
    MOVE_DIRECTIONS.include?(direction)
  end

  def self.valid?(direction)
    TYPES.include?(direction)
  end
end
