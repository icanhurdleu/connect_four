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

  def is_valid_col?(col)
    # returns false if column is full, true otherwise
    @board[col-1].include?("*")
  end

  def board_full?
    # returns true if there are still open columns, false if board is full
    @board.flatten.any?("*") ? false : true
  end

  def win?
    return true if win_horiz?
    return true if win_vert?
    return true if win_diag_up?
    return true if win_diag_down?
  end

  def win_horiz?
    (0..5).each do |col|
      (0..3).each do |row|
        return true if (@board[row][col] == @board[row+1][col]) &&
                       (@board[row][col] == @board[row+2][col]) &&
                       (@board[row][col] == @board[row+3][col]) &&
                       (@board[row][col] != "*")
      end
    end
    false
  end

  def win_vert?
    (0..6).each do |row|
      (0..2).each do |col|
        return true if (@board[row][col] == @board[row][col+1]) &&
                       (@board[row][col] == @board[row][col+2]) &&
                       (@board[row][col] == @board[row][col+3]) &&
                       (@board[row][col] != "*")
      end
    end
    false
  end

  def win_diag_up?
    (0..3).each do |row|
      (0..2).each do |col|
        return true if (@board[row][col] == @board[row+1][col+1]) &&
                       (@board[row][col] == @board[row+2][col+2]) &&
                       (@board[row][col] == @board[row+3][col+3]) &&
                       (@board[row][col] != "*")
      end
    end
    false
  end

  def win_diag_down?
    (0..3).each do |row|
      (3..5).each do |col|
        return true if (@board[row][col] == @board[row+1][col-1]) &&
                       (@board[row][col] == @board[row+2][col-2]) &&
                       (@board[row][col] == @board[row+3][col-3]) &&
                       (@board[row][col] != "*")
      end
    end
    false
  end

end
