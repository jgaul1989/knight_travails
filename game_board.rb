# frozen_string_literal: true

require_relative 'knight'

# class to represent chess game board
class GameBoard
  attr_accessor :root

  def initialize(curr_location, target)
    # the knight's current location
    @root = Knight.new(curr_location)
    # the destination the chess piece is trying to reach
    @target = target
    @is_target_found = false
  end

  def build_tree(node = @root)
    # build a tree using a queue; break out of the loop once
    # the first move that equals target is found
    curr_node = node
    queue = []
    queue.push(curr_node)
    until @is_target_found
      moves = Knight.possible_moves(curr_node.coordinates)
      curr_node.set_children(moves)
      @is_target_found = true if moves.include?(@target)
      curr_node.children.each { |child| queue.push(child) unless child.nil? }
      queue.shift
      curr_node = queue[0]
    end
    node
  end

  def bfs(curr_node = @root)
    # perform a bfs to search for the first node that reached the target destination
    queue = []
    queue.push(curr_node)
    found = false
    until queue.empty?
      found = true if curr_node.coordinates == @target
      break if curr_node.coordinates == @target

      curr_node.children.each { |child| queue.push(child) unless child.nil? }
      queue.shift
      curr_node = queue[0]
    end
    # return the node if it's found else return not found
    found ? curr_node : 'Not found'
  end
end
