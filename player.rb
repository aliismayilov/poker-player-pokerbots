
class Player

  VERSION = "call big blind"

  def bet_request(game_state)
    game_state[:small_blind] * 2
  end

  def showdown(game_state)

  end
end
