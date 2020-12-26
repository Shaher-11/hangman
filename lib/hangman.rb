
class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza", "home", "house", "boy", "man", "women"]
def self.random_word
  DICTIONARY.sample
end 
  def initialize 
    @secret_word = Hangman.random_word
    @guess_word = Array.new(@secret_word.length, '_')
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end 
  def guess_word
    @guess_word
  end
  def attempted_chars
    @attempted_chars
  end
  def remaining_incorrect_guesses
    @remaining_incorrect_guesses
  end
  def already_attempted?(char)
    if attempted_chars.include?(char)
      true
    else 
      false
    end
  end
  def get_matching_indices(char)
    matching_indices = []
  @secret_word.each_char.with_index do |secret_char, i|
    if char == secret_char
      matching_indices << i
    end
  end

    matching_indices
  end
  def fill_indices(char, indices)
   indices.each do |index|
    @guess_word[index] = char
   end
  end
  def try_guess(char)
   if  self.already_attempted?(char)
    puts "that has already been attempted"
    return false
   end
   @attempted_chars << char

   matches = self.get_matching_indices(char)
    self.fill_indices(char, matches)
    @remaining_incorrect_guesses -= 1 if matches.empty?
    true
  end
  def ask_user_for_guess
    puts "Hi buddy Enter a char please"
    self.try_guess(gets.chomp)
  end
  def win?
    if @guess_word.join("") == @secret_word
      puts "WIN"
      return true
    else
      return false
    end
  end
  def lose?
   if @remaining_incorrect_guesses == 0
    puts "LOSE"
    return true
  else 
    return false
  end
end 
def game_over?
if self.win? || self.lose?
  puts @secret_word
  return true 
else 
  return false 
end 
end
end 