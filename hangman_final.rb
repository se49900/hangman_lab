f = File.new("list.txt")
word_arr = f.readlines
word_ = word_arr.sample.chomp
f.close
guessed = []
final_answer = ""
alphabet = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j","k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
wrongs = 0
guessed_letters = []
def draw_man(number)
  drawman = []
  drawman.push " _______________ "
  drawman.push "|       |       |"
  drawman.push "|       @       |"
  drawman.push "|      /|\\      |"
  drawman.push "|       |       |"
  drawman.push "|      / \\      |"
  drawman.push "|_______________|"
  if number == 0
    drawman[2] = "|               |"
    drawman[3] = "|               |"
    drawman[4] = "|               |"
    drawman[5] = "|               |"
  elsif number ==  1
    drawman[3] = "|               |"
    drawman[4] = "|               |"
    drawman[5] = "|               |"
  elsif number == 2
    drawman[3] = "|      /|\\      |"
    drawman[4] = "|               |"
    drawman[5] = "|               |"
  elsif number == 3
    drawman[4] = "|       |       |"
    drawman[5] = "|               |"
  elsif number == 4
    drawman[7] = "   You lose!!!"
    puts drawman
    sleep(1.5)
    system("clear")
    exit
  end
  puts drawman
end
def display_result(word, guessed_letters)
  arr = word.split("")
  @new_arr = []
  arr.each do |letter|
    if guessed_letters.include?(letter) == false
      @new_arr.push "_"
    elsif guessed_letters.include?(letter) == true
      @new_arr.push letter
    end
    end
  puts @new_arr.join(" ")
  if @new_arr.include?("_") == false
    system("clear")
    draw_man(0)
    puts "                              YOU WIN!"
    sleep(1.5)
    exit
  end
end
puts "Welcome to Hangman. The rules are...
1) For this game, you are trying to guess a word one letter at a time
2) The only information you will be given to start with is how long the word is.If you guess a correct letter, that letter will be filled in.
3) If the letter you choose is not a part of the given word, the hangman will   gain a body part.
4) If all the body parts appear, you lose.
5) When you're ready to guess a letter, just enter it under the prompt. The wordyou are guessing has been randomly chosen from a list of different animals. 

Good Luck!

Ready? (enter to begin)"
go = gets.chomp
while guessed != word_
  system("clear")
  draw_man(wrongs)
  output_guessed = guessed_letters.join(", ")
  output_guessed.downcase!
  output_alphabet = alphabet.join(", ")
  puts "Letters to be guessed: #{output_alphabet} \nLetters/words guessed: #{output_guessed}"
  puts "
  Word:"
  puts display_result(word_, guessed)
  puts "What's your guess? You can put a single letter, or try to guess the whole word!"
  final_answer = gets.chomp
  guessed.push final_answer.downcase
  if final_answer.downcase == word_
    system("clear")
    draw_man(0)
    puts "			YOU WON!"
    sleep(1)
    exit
  end
if word_.include?(final_answer) == false
 wrongs += 1
end
  guessed_letters.push final_answer
  alphabet.delete(final_answer)
end
