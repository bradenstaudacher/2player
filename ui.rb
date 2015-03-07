# class UI
#   def initialize

# end
require_relative 'game'

class UserInterface

  attr_accessor :game

  def get_answer(num1, num2)
    puts "#{@game.current_player.player_name}: What does #{num1} plus #{num2} equal?"
    answer = gets.chomp
    if @game.answer_is_number(answer)
      puts "Please enter a number!"
      get_answer(num1,num2)
    else
      answer
    end
  end

  def finalprint
    spacer = "           |"
    puts "++++++++++FINAL GAME SCORE++++++++++"
    puts "Points      |Lives       |Name    "
    puts "------------|------------|-----------"
    puts "#{@game.player1.player_points}" + spacer + "#{@game.player1.player_lives}" + spacer + "#{@game.player1.player_name}"
    puts "-----------------------------------"
    puts "#{@game.player2.player_points}" + spacer + "#{@game.player2.player_lives}" + spacer + "#{@game.player2.player_name}"
    puts "+++++++++CURRENT  STANDINGS+++++++++"
    puts "Games Won |Games Lost |Name        "
    populate_standings
  end

  def populate_standings
    spacer = "           |"
    pos1 = @game.currentranks[0]
    pos2 = @game.currentranks[1]
    puts "#{pos1.player_wins}" + spacer + "#{pos1.player_losses}" + spacer + "#{pos1.player_name}"
    puts "-----------------------------------"
    puts "#{pos2.player_wins}" + spacer + "#{pos2.player_losses}" + spacer + "#{pos2.player_name}"
  end

  def gameover?
    if @game.is_gameover?
      @game.tally_win
      @game.tally_loss
      dead_player = @game.get_dead_player
      puts "Gameover! #{dead_player.player_name} ran out of lives."
      finalprint
      return true
    end
    false
  end

  def turn(player)
    num1, num2 = @game.rollnum
    answer = get_answer(num1, num2)
    if @game.answer(player, answer, num1, num2)
      puts "Correct #{player.player_name}, your score is #{player.player_points}"
    else
      player.player_lives == 1 ? proplife = "life" : proplife = "lives"
      puts "Incorrect #{player.player_name}, #{player.player_lives} "+proplife+" remaining"
    end
    @game.next_player
  end

  def maintask
    loop do
      turn(@game.current_player)
      break if gameover? && !restarting?
    end
  end

  def start
    puts "Please enter your name Player1"
    player1 = Player.new(gets.chomp,0,3,0,0)
    puts "Please enter your name Player2"
    player2 = Player.new(gets.chomp,0,3,0,0)
    @game = Game.new(player1, player2)
    maintask
  end
  def reset_game
    player1 = Player.new(@game.player1.player_name,0,3,@game.player1.player_wins,0)
    player2 = Player.new(@game.player2.player_name,0,3,@game.player2.player_wins,0)
    @game = Game.new(player1, player2)
  end
  def restarting?
    puts "Do you want to restart? (y/n)"
    if gets.chomp == "y"
      system("clear")
      reset_game
      return true
    end
    system("clear")
    return false
  end

end

UserInterface.new().start

