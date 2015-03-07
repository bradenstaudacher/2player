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

  attr_accessor :current_player, :player1, :player2

  def initialize(p1,p2) 
    @player1 = p1
    @player2 = p2
    @current_player = @player1
  end

  def next_player
    if @current_player == @player1
      @current_player = @player2
    else
      @current_player = @player1
    end
    @current_player
  end

  def rollnum
    num1 = rand(50)
    num2 = rand(50)
    return [num1, num2]
  end

  def answer_is_number(answer)
    /\d+/.match(answer) == nil
  end

  def answer(player, answer, num1, num2)
    solution = num1 + num2
    correct = solution == answer.to_i
    if correct
      player.addpoint
    else
      player.loselife
    end
    correct
  end

  def is_gameover?
    @player1.player_lives == 0 || @player2.player_lives == 0
  end

  def is_player_dead?(player)
    player.player_lives == 0
  end

  def get_dead_player
    (is_player_dead?(@player1) ? @player1 : @player2)
  end

  def get_winner
    (is_player_dead?(@player1) ? @player2 : @player1)
  end

  def tally_win
    get_winner.wongame
  end

  def tally_loss
    get_dead_player.lostgame
  end

  def currentranks
    @player1.player_wins > @player2.player_wins ? [@player1, @player2] : [@player2, @player1]
  end  
end
