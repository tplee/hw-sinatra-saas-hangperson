class HangpersonGame

  attr_accessor :word, :guesses, :wrong_guesses
  
  def initialize(new_word)
    @word = new_word
    @guesses = ''
    @wrong_guesses = ''
  end

  def self.get_random_word
    require 'uri'
    require 'net/http'
    uri = URI('http://watchout4snakes.com/wo4snakes/Random/RandomWord')
    Net::HTTP.post_form(uri ,{}).body
  end

  def guess(letter)
    raise ArgumentError, "You did not input a letter" unless (/^[a-zA-Z]$/ || nil).match(letter)
    temp = letter.downcase
    if @word.include?(temp)
      if @guesses.include?(temp)
        false
      else
        @guesses << temp
      end
    else
      if @wrong_guesses.include?(temp)
        false
      else
        @wrong_guesses << temp
      end
    end
  end
  
  def word_with_guesses
    word_progress = @word.gsub(/./,'-')
    word_progress = word_progress.split("")
    word_array = @word.split("")
    guesses_array = @guesses.split("")
    guesses_array.each_with_index do |x,i|
      word_array.each_with_index do |y,j|
        if word_array[j] == guesses_array[i]
          word_progress[j] = word_array[j]
        end
      end
    end
    return word_progress.join("")
  end
  
  def check_win_or_lose
    return :lose if @wrong_guesses.length >= 7
    return :win if @guesses.length == @word.length
    return :play
  end
  
end