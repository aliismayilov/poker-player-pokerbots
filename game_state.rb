class GameState
  attr_reader :json

  def initialize(json)
    @json = json
  end

  def call_amount
    json[:current_buy_in] - json[:players][json[:in_action]][:bet] + json[:minimum_raise]
  end

  def small_blind
    json[:small_blind]
  end

  def high_card?
    community_cards.blank? && hole_cards.any? do |card|
      card[:rank] == "A"
    end
  end

  def flush?
    community_suits = community_cards.map { |c| c[:suit] }
    hole_suits = hole_cards.map { |c| c[:suit] }

    (community_suits + hole_suits).tally.any? do |suit, count|
      count >= 5
    end
  end

  def pairs?
    return true if hole_cards.map { |card| card[:rank] }.uniq.count == 1

    return false if community_cards.blank?

    hole_cards.each do |hole_card|
      community_cards.each do |community_card|
        if community_card[:rank] == hole_card[:rank]
          return true
        end
      end
    end

    false
  end

  def community_cards
    json[:community_cards]
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
