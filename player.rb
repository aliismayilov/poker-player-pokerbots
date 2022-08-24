require 'active_support/all'
require_relative "game_state"
require "pry"

class Player

  VERSION = "Symbolize keys"

  def bet_request(json)
    game_state = GameState.new(json)

    if game_state.flush?
      game_state.call_amount + game_state.raise_amount(200)
    elsif game_state.pairs?
      game_state.call_amount + game_state.raise_amount(10)
    elsif game_state.high_card?
      game_state.call_amount + game_state.raise_amount(4)
    else
      game_state.call_amount
    end
  end

  def showdown(game_state)

  end
end
