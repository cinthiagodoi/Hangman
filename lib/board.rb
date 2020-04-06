require './lib/game.rb'

class Board
  attr_reader :remain_guesses, :misses, :right_choices, :word

  def initialize(attempt_player)
    @misses = attempt_player.misses
    @right_choices = attempt_player.right_choices
    @word = attempt_player.word

    board_game
  end

  def board_game
    @remain_guesses = (5 - @misses.size)
    p populate_board
    p "Misses attempts #{@misses.join(',')}"
    p "Remain guesses: #{@remain_guesses}"
  end

  def populate_board
    regex = @right_choices.any? && @right_choices.join('|') || '.'
    @print_board = @word.gsub(/[^#{regex}]/, "_")  
  end

  def won?
    if @word == @print_board
      p "You won!"
      @remain_guesses = 0
    elsif @remain_guesses == 0 
      p "You lose, the secret was:  #{@word}"
    end
  end
  
end