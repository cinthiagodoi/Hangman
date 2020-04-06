require './lib/game.rb'

class Save
  def initialize(board = nil)
    @misses = board&.misses
    @right_choices = board&.right_choices
    @word = board&.word 

  end

  def execute
    File.open('save.txt', 'w+') do |f|
      Marshal.dump(to_save, f)
    end
  end

  def to_save
    {misses: @misses, right_choices: @right_choices, word: @word}
  end

  def load 
    print "1: new game\n2: load game\nWhat you would like to do? "
    should_load = gets.chomp.downcase.strip 

    if should_load == "2"
      File.open('save.txt') do |f|
        @b = Marshal.load(f) 
      end  
    end

    Game.new(@b)
  end
end  