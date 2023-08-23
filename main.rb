# frozen_string_literal: true

require_relative 'knight'
require_relative 'game_board'

# driver code to test the program
def knight_moves(curr_location, target)
  game_board = GameBoard.new(curr_location, target)
  root = game_board.build_tree
  shortest_distance_node = game_board.bfs(root)
  queue = []
  queue.unshift(shortest_distance_node)
  until shortest_distance_node.parent.nil?
    shortest_distance_node = shortest_distance_node.parent
    queue.unshift(shortest_distance_node)
  end
  puts "You made it in #{queue.length - 1} moves! Here's your path!"
  puts queue
end

knight_moves([3, 3], [4, 3])
