
class Player

  VERSION = "Symbolize keys"

  def bet_request(game_state)
    game_state[:current_buy_in] - game_state[:players][game_state[:in_action]][:bet] + game_state[:minimum_raise]
  end

  def showdown(game_state)

  end
end
