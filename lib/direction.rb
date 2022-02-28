class Direction
  RIGHT = 'R'.freeze
  LEFT = 'L'.freeze
  FORWARD = 'F'.freeze
  TYPES = [RIGHT, LEFT, FORWARD].freeze

  def self.right
    RIGHT
  end

  def self.left
    LEFT
  end

  def self.forward
    FORWARD
  end

  def self.valid?(direction)
    TYPES.include?(direction)
  end
end
