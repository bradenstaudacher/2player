class Player
  
  attr_accessor(:player_name, :player_points, :player_lives)

  def initialize(player_name, player_points, player_lives)
    @player_name = player_name
    @player_points = player_points
    @player_lives = player_lives
  end
  def addpoint
    @player_points += 1
  end
  def loselife
    @player_lives -= 1
  end
end

 #player1 = Player.new("Braden", 0, 3)
# puts player1.player_points

