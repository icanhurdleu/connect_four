# lib/connect_four.rb 

require "colorize"
require_relative "board"
require_relative "human_player"

red = "◉".red
blue = "◉".blue

class Game
  attr_reader :player1, :player2, :players

  # takes two arrays with player name and color
  def initialize(player1, player2)
    @player1 = HumanPlayer.new(player1[0], player1[1])
    @player2 = HumanPlayer.new(player2[0], player2[1])
    @players = [@player1, @player2]
    @board = Board.new
    @current_player = select_start_player
  end

  def play
    # loops turns until there is a winner or the game ends in a tie
    intro
    puts "\n#{@current_player.name} is the first player"
    loop do 
      @board.print_board
      puts "\n#{@current_player.name}'s turn."
      selected_col = @current_player.get_move
      until @board.is_valid_col?(selected_col)
        puts "That column is full! Please select another column."
        selected_col = @current_player.get_move
      end
      @board.add_marker(selected_col, @current_player.color)
      if @board.win?
        @board.print_board
        puts "\n#{@current_player.name} wins!!!!"
        break
      end
      if @board.board_full?
        @board.print_board
        puts "\nIt's a tie!"
        break
      end
      @current_player = next_player
    end
    
  end

  def next_player
    # switches the current player to the next player
    @current_player == @player1 ? @player2 : @player1
  end

  def select_start_player
    @players[rand(0..1)]
  end

  def intro
    puts "\n\n\n\n\n"
    puts "Welcome to Connect 4!"
    puts "Empty spaces are designated by '*'"
    puts "Try to get 4 in a row to win."
  end

  def player_test
    puts @current_player.name
  end

end


player1 = ["Sam", red]
player2 = ["Emma", blue]

game = Game.new(player1, player2)
game.play