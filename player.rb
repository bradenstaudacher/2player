class Player
  
  attr_accessor(:player_name, :player_points, :player_lives, :player_wins, :player_losses)

  def initialize(player_name, player_points, player_lives, player_wins, player_losses)
    @player_name = player_name
    @player_points = player_points
    @player_lives = player_lives
    @player_wins = player_wins
    @player_losses = player_losses
  end
  def addpoint
    @player_points += 1
  end
  def loselife
    @player_lives -= 1
  end
  def wongame
    @player_wins += 1
  end
  def lostgame
    @player_losses += 1
  end
end


