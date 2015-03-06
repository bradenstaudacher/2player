require_relative "player"
require_relative "ui"
require "pry"

# class Game
#   attr_accessor(:players, :turn, :ui)
#   def initialize
#     @players = initplayers
#     @turn = 1
#     @ui = initui
#   end
# end

#Game.new()





def maintask
  
  loop do

    turn = 1
    @num1 = rollnum[0]
    @num2 = rollnum[1]
    askquestion(@player1, @num1, @num2)
    answerhandler(@player1, @num1, @num2)
    break if gameover?

    turn = 2
    @num1 = rollnum[0]
    @num2 = rollnum[1]
    askquestion(@player2, @num1, @num2)
    answerhandler(@player2, @num1, @num2)
    break if gameover?

  end
end


def initplayers
  puts "Please enter your name Player1"
  @player1 = Player.new(gets.chomp,0,3)
  puts "Please enter your name Player2"
  @player2 = Player.new(gets.chomp,0,3)
  return [@player1, @player2]
end

initplayers
maintask
