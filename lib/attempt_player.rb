require './lib/board.rb'
require './lib/secret_word.rb'

class AttemptPlayer
  attr_reader :misses, :right_choices, :word

  def initialize(board = {})
    @word = board.dig(:word) || SecretWord.new.word
    @misses = board.dig(:misses) || []
    @right_choices = board.dig(:right_choices) || []
  end

  def choose_letter
    print 'Please choose a letter: '
    @letter = gets.chomp.downcase.strip
    check_letter
  end

  def check_letter
    if @word.include? @letter 
      @right_choices.push(@letter)
    else
      @misses.push(@letter)
    end
  end
  
end


