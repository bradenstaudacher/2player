require_relative "player"
require_relative "ui"
require "pry"

# class Game
#   attr_accessor(:players, :turn, :ui)
#   def initialize
#     @players = initplayers
#     @turn = turn
#   end
# end

# Game.new()

class Game
  
  def start
    puts "Please enter your name Player1"
    @player1 = Player.new(gets.chomp,0,3)
    puts "Please enter your name Player2"
    @player2 = Player.new(gets.chomp,0,3)
    maintask
  end

  def turn(player)
    num1 = rollnum[0]
    num2 = rollnum[1]
    askquestion(player, num1, num2)
    answerhandler(player, num1, num2)
    gameover?
  end

  def maintask
    loop do
      break if turn(@player1)
      break if turn(@player2)
    end
  end

  
end

Game.new().start
