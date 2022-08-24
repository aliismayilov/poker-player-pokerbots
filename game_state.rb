class GameState
  RANKS = %w[
    2
    3
    4
    5
    6
    7
    8
    9
    10
    J
    Q
    K
    A
  ].freeze

  attr_reader :json

  def initialize(json)
    @json = json
  end

  def call_amount
    json[:current_buy_in] - json[:players][json[:in_action]][:bet]
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

  def raise_amount(times)
    [json[:minimum_raise], small_blind * times].max
  end

  def first_round_and_anybody_bet_8_times_the_small_blind_and_shitty_hand?
    community_cards.blank? && somebody_bet_small_blind?(8) && hole_cards.all? do |card|
      RANKS.index(card[:rank]) < RANKS.index("10")
    end && !promising_flush? && !promising_straight?
  end

  def promising_flush?
    hole_suits = hole_cards.map { |c| c[:suit] }

    community_cards.blank? && hole_suits.uniq.count == 1
  end

  def promising_straight?
    sorted_hole_ranks = hole_cards.map { |c| c[:rank] }.sort_by do |rank|
      RANKS.index(rank)
    end

    RANKS.join.include?(sorted_hole_ranks.join)
  end

  def community_cards_and_anybody_bet_10_times?
    community_cards.present? && somebody_bet_small_blind?(10)
  end

  def somebody_bet_small_blind?(times)
    json[:players].any? do |player|
      player[:bet] > small_blind * times
    end
  end

  def straight?
    return false if community_cards.blank?

    community_ranks = community_cards.map { |c| c[:rank] }
    hole_ranks = hole_cards.map { |c| c[:rank] }

    sorted_ranks = (community_ranks + hole_ranks).sort_by do |rank|
      RANKS.index(rank)
    end

    RANKS.join.include?(sorted_ranks.join)
  end
end
