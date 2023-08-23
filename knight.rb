# frozen_string_literal: true

# class to represent the knight chess piece
class Knight
  attr_accessor :coordinates
  attr_reader :children, :parent

  def initialize(coordinate, parent = nil)
    @parent = parent
    @coordinates = coordinate
    @children = []
  end

  def set_children(moves)
    # if a move is valid then set a new node else set it to nil
    moves.each { |move| valid_move?(move) ? @children.push(Knight.new(move, self)) : @children.push(nil) }
  end

  def self.possible_moves(curr_location)
    # return a list of all possible moves a knight can make
    moves = []
    moves.push([curr_location[0] + 2, curr_location[1] + 1])
    moves.push([curr_location[0] + 1, curr_location[1] + 2])
    moves.push([curr_location[0] - 1, curr_location[1] + 2])
    moves.push([curr_location[0] - 2, curr_location[1] + 1])
    moves.push([curr_location[0] - 2, curr_location[1] - 1])
    moves.push([curr_location[0] - 1, curr_location[1] - 2])
    moves.push([curr_location[0] + 1, curr_location[1] - 2])
    moves.push([curr_location[0] + 2, curr_location[1] - 1])
    moves
  end

  private

  def valid_move?(move)
    # check if a move is a valid location on the chess board
    move[0] >= 0 && move[0] < 8 && move[1] >= 0 && move[1] < 8
  end

  def to_s
    "(#{@coordinates})"
  end
end
