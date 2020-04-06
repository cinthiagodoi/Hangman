require './lib/secret_word.rb'
require './lib/attempt_player.rb'
require './lib/board.rb'

class Game
  def initialize(board = {})
    @attempt_player = AttemptPlayer.new(board)
    @board = Board.new(@attempt_player)

    run
  end

  def run
    while @board.remain_guesses > 0
      print "Would you like to save the game? (y/n)\n"
      save = gets.chomp.downcase.strip == "y"
      if save
        save = Save.new(@board)
        save.execute
      end
      @choice = @attempt_player.choose_letter
      @board.board_game
      @board.won?
    end   
  end

  
end