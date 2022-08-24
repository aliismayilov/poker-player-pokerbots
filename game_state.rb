class GameState
  attr_reader :json

  def initialize(json)
    @json = json
  end

  def call_amount
    json[:current_buy_in] - json[:players][json[:in_action]][:bet] + json[:minimum_raise]
  end

  def raise_10_small_blind
    call_amount + json[:small_blind] * 10
  end

  def pairs?
    return true if hole_cards.map { |card| card[:rank] }.uniq.count == 1

    return false if json[:community_cards].blank?

    hole_cards.each do |hole_card|
      json[:community_cards].each do |community_card|
        if community_card[:rank] == hole_card[:rank]
          return true
        end
      end
    end

    false
  end

  def hole_cards
    myself[:hole_cards]
  end

  def myself
    json[:players].find do |player|
      player[:hole_cards].present?
    end
  end
end
