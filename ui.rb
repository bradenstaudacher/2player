# class UI
#   def initialize

# end

def askquestion(player, num1, num2)
  puts "#{player.player_name}: What does #{num1} plus #{num2} equal?"
end

def finalprint
  spacer = "       |"
  puts "+++++FINAL GAME SCORE+++++"
  puts "Points  |Lives   |Name    "
  puts "--------|--------|--------"
  puts "#{@player1.player_points}" + spacer + "#{@player1.player_lives}" + spacer + "#{@player1.player_name}"
  puts "--------------------------"
  puts "#{@player2.player_points}" + spacer + "#{@player2.player_lives}" + spacer + "#{@player2.player_name}"
end

def answerhandler(player, num1, num2)
  solution = num1 + num2
  answer = gets.chomp
  if /\d+/.match(answer) == nil
    puts "Please enter a number!"
    answerhandler(player, num1, num2)
  else
    if solution == answer.to_i
      player.addpoint
      puts "Correct #{player.player_name}, your score is #{player.player_points}"
    else
      player.loselife
      player.player_lives == 1 ? proplife = "life" : proplife = "lives"
      puts "Incorrect #{player.player_name}, #{player.player_lives} "+proplife+" remaining"
    end
  end
end

def gameover?
  state = @player1.player_lives == 0 || @player2.player_lives == 0
  p1loss = true if @player1.player_lives == 0
  p2loss = true if @player2.player_lives == 0

  if state == true && p1loss == true
    puts "Gameover! #{@player1.player_name} ran out of lives."
    finalprint
  end
  if state == true && p2loss == true
    puts "Gameover! #{@player2.player_name} ran out of lives."
    finalprint
  end 
  # if playagain?
  #   maintask
  # else
  return state
end

# def playagain?
#   puts "Would you like to play again? (y/n)"
#   input = gets.chomp
#   if input == "y" || "yes"
#     return true
#   end
#   if input == "n" || "no"
#     return false
#   end
# end

def rollnum
  num1 = rand(50)
  num2 = rand(50)
  return [num1, num2]
end
