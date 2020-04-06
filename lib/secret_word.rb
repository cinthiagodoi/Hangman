
class SecretWord
  attr_reader :word

  def initialize
    @words = File.readlines "dictionary.txt"

    @word = choose_secret_word
  end

  def choose_secret_word
    random = @words.select{|word| word.chomp.size > 5 && word.chomp.size < 12}
    (random.sample.downcase).chomp
  end
  
end