require 'active_support/all'
require_relative "game_state"
require "pry"

class Player

  VERSION = "Symbolize keys"

  def bet_request(json)
    game_state = GameState.new(json)

    if game_state.flush?
      game_state.call_amount + game_state.raise_amount(200)
    elsif game_state.straight?
      game_state.call_amount + game_state.raise_amount(150)
    elsif game_state.pairs?
      game_state.call_amount + game_state.raise_amount(10)
    elsif game_state.high_card?
      game_state.call_amount + game_state.raise_amount(4)
    elsif game_state.first_round_and_anybody_bet_8_times_the_small_blind_and_shitty_hand?
      0
    else
      game_state.call_amount
    end
  end

  def showdown(game_state)

  end
end
