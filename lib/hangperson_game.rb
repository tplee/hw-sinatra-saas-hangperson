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
     raise ArgumentError, "You did not input a latter" unless letter =~ /[[:alpha:]]/
  end

end