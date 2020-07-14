# lib/board.rb 

class Board
  attr_accessor :board 

  def initialize
    @board = create_new_board
  end

  def create_new_board
    # creates new board (7 columns x 6 rows)
    Array.new(7) {Array.new(6, "*")}
  end

  def print_board
    # prints a user friendly version of the current board state
    # the board is structured so bottom left is [0][0]
    # and top right is [6][5]
    puts "\n"
    5.downto(0) do |row|
      print("| ")
      (0..6).each do |col|
        print("#{@board[col][row]} ")
      end
      print "|\n"
    end
    puts "|---------------|"
    puts "| 1 2 3 4 5 6 7 |\n"
  end

  def add_marker(col, color)
    # adds a marker to the respective column
    @board[col-1][get_col_height(col)] = color
  end

  def get_col_height(col)
    # returns the height of pieces in a specified column
    # e.g. if there are 2 pieces in a column, this will return 2
    6 - @board[col-1].count("*")
  end

  def add_test_marker
    @board[0][0] = "O"
    @board[0][1] = "O"
    @board[4][1] = "X"
  end

  def is_valid_col?(col)
    # returns false if column is full, true otherwise
    @board[col-1].include?("*")
  end


end

board = Board.new 
board.add_test_marker
board.add_marker(1, "O")
board.print_board

puts board.is_valid_col?(1)
puts board.get_col_height(1)
