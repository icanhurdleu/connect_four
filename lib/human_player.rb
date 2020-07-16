class HumanPlayer
  attr_reader :name, :color

  def initialize(name, color)
    @name = name
    @color = color
    @@valid_columns = [1,2,3,4,5,6,7]
  end

  def get_move
    # gets move from player
    puts "\nEnter the column number where you"
    print "want to drop your piece (1 to 7): "
    while true
      col = gets.chomp.to_i
      return col if valid_move?(col)
      print "\nPlease enter a valid column: "
    end
  end

  def valid_move?(col)
    # returns true if selected move is valid, false otherwise
    return false unless @@valid_columns.include?(col)
    true
  end

end
