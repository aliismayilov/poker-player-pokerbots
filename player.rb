
class Player

  VERSION = "call big blind"

  def bet_request(game_state)
    game_state[:current_buy_in] - game_state[:players][game_state[:in_action]][:bet]
  end

  def showdown(game_state)

  end
end
