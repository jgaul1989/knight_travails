# frozen_string_literal: true

require_relative 'knight'

# class to represent chess game board
class GameBoard
  attr_accessor :root

  def initialize(curr_location, target)
    @root = Knight.new(curr_location)
    @target = target
  end

  def build_tree(node = @root)
    moves = Knight.possible_moves(node.coordinates)
    node.set_children(moves)
    node.children.each { |child| build_tree(child) unless child.nil? } unless moves.include?(@target)
  end

  def bfs(curr_node = @root)
    queue = []
    queue.push(curr_node)
    until queue.empty?
      break if curr_node.coordinates == @target

      curr_node.children.each { |child| queue.push(child) unless child.nil? }
      queue.shift
      curr_node = queue[0]
    end
    curr_node
  end
end
