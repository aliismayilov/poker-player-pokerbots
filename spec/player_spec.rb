require "spec_helper"
require_relative "../player"

RSpec.describe Player do
  subject { described_class.new }

  describe "#bet_request" do
    context "minimum raise" do
      let(:game_state) do
        {
          "tournament_id":"550d1d68cd7bd10003000003",
          "game_id":"550da1cb2d909006e90004b1",
          "round":0,
          "bet_index":0,
          "small_blind": 100,
          "current_buy_in": 320,
          "pot": 400,
          "minimum_raise": 240,
          "dealer": 1,
          "orbits": 7,
          "in_action": 1,
          "players": [
              {
                  "id": 0,
                  "name": "Albert",
                  "status": "active",
                  "version": "Default random player",
                  "stack": 1010,
                  "bet": 30
              },
              {
                  "id": 1,
                  "name": "Bob",
                  "status": "active",
                  "version": "Default random player",
                  "stack": 1590,
                  "bet": 80,
                  "hole_cards": [
                      {
                          "rank": "4",
                          "suit": "hearts"
                      },
                      {
                          "rank": "K",
                          "suit": "spades"
                      }
                  ]
              },
              {
                  "id": 2,
                  "name": "Chuck",
                  "status": "out",
                  "version": "Default random player",
                  "stack": 0,
                  "bet": 0
              }
          ],
          "community_cards": [
              {
                  "rank": "5",
                  "suit": "spades"
              },
              {
                  "rank": "A",
                  "suit": "hearts"
              },
              {
                  "rank": "6",
                  "suit": "clubs"
              }
          ]
      }
      end

      it "responds with call" do
        expect(subject.bet_request(game_state)).to eq(240)
      end
    end

    context "a low pair" do
      let(:game_state) do
        {
          "tournament_id":"550d1d68cd7bd10003000003",
          "game_id":"550da1cb2d909006e90004b1",
          "round":0,
          "bet_index":0,
          "small_blind": 10,
          "current_buy_in": 320,
          "pot": 400,
          "minimum_raise": 240,
          "dealer": 1,
          "orbits": 7,
          "in_action": 1,
          "players": [
              {
                  "id": 0,
                  "name": "Albert",
                  "status": "active",
                  "version": "Default random player",
                  "stack": 1010,
                  "bet": 320
              },
              {
                  "id": 1,
                  "name": "Bob",
                  "status": "active",
                  "version": "Default random player",
                  "stack": 1590,
                  "bet": 80,
                  "hole_cards": [
                      {
                          "rank": "6",
                          "suit": "hearts"
                      },
                      {
                          "rank": "K",
                          "suit": "spades"
                      }
                  ]
              },
              {
                  "id": 2,
                  "name": "Chuck",
                  "status": "out",
                  "version": "Default random player",
                  "stack": 0,
                  "bet": 0
              }
          ],
          "community_cards": [
              {
                  "rank": "4",
                  "suit": "spades"
              },
              {
                  "rank": "A",
                  "suit": "hearts"
              },
              {
                  "rank": "6",
                  "suit": "clubs"
              }
          ]
      }
      end

      it "responds with raise 10 times small_blind" do
        expect(subject.bet_request(game_state)).to eq(0)
      end
    end

    context "a high pair" do
      let(:game_state) do
        {
          "tournament_id":"550d1d68cd7bd10003000003",
          "game_id":"550da1cb2d909006e90004b1",
          "round":0,
          "bet_index":0,
          "small_blind": 100,
          "current_buy_in": 320,
          "pot": 400,
          "minimum_raise": 240,
          "dealer": 1,
          "orbits": 7,
          "in_action": 1,
          "players": [
              {
                  "id": 0,
                  "name": "Albert",
                  "status": "active",
                  "version": "Default random player",
                  "stack": 1010,
                  "bet": 320
              },
              {
                  "id": 1,
                  "name": "Bob",
                  "status": "active",
                  "version": "Default random player",
                  "stack": 1590,
                  "bet": 80,
                  "hole_cards": [
                      {
                          "rank": "6",
                          "suit": "hearts"
                      },
                      {
                          "rank": "K",
                          "suit": "spades"
                      }
                  ]
              },
              {
                  "id": 2,
                  "name": "Chuck",
                  "status": "out",
                  "version": "Default random player",
                  "stack": 0,
                  "bet": 0
              }
          ],
          "community_cards": [
              {
                  "rank": "4",
                  "suit": "spades"
              },
              {
                  "rank": "Q",
                  "suit": "hearts"
              },
              {
                  "rank": "K",
                  "suit": "clubs"
              }
          ]
      }
      end

      it "responds with raise 10 times small_blind" do
        expect(subject.bet_request(game_state)).to eq(1240)
      end
    end

    context "high card" do
      let(:game_state) do
        {
          "tournament_id":"550d1d68cd7bd10003000003",
          "game_id":"550da1cb2d909006e90004b1",
          "round":0,
          "bet_index":0,
          "small_blind": 10,
          "current_buy_in": 320,
          "pot": 400,
          "minimum_raise": 240,
          "dealer": 1,
          "orbits": 7,
          "in_action": 1,
          "players": [
              {
                  "id": 0,
                  "name": "Albert",
                  "status": "active",
                  "version": "Default random player",
                  "stack": 1010,
                  "bet": 320
              },
              {
                  "id": 1,
                  "name": "Bob",
                  "status": "active",
                  "version": "Default random player",
                  "stack": 1590,
                  "bet": 80,
                  "hole_cards": [
                      {
                          "rank": "6",
                          "suit": "hearts"
                      },
                      {
                          "rank": "A",
                          "suit": "spades"
                      }
                  ]
              },
              {
                  "id": 2,
                  "name": "Chuck",
                  "status": "out",
                  "version": "Default random player",
                  "stack": 0,
                  "bet": 0
              }
          ],
          "community_cards": []
      }
      end

      it "calls" do
        expect(subject.bet_request(game_state)).to eq(480)
      end
    end

    context "no community cards" do
      let(:game_state) do
        {
          "tournament_id":"550d1d68cd7bd10003000003",
          "game_id":"550da1cb2d909006e90004b1",
          "round":0,
          "bet_index":0,
          "small_blind": 10,
          "current_buy_in": 320,
          "pot": 400,
          "minimum_raise": 240,
          "dealer": 1,
          "orbits": 7,
          "in_action": 1,
          "players": [
              {
                  "id": 0,
                  "name": "Albert",
                  "status": "active",
                  "version": "Default random player",
                  "stack": 1010,
                  "bet": 320
              },
              {
                  "id": 1,
                  "name": "Bob",
                  "status": "active",
                  "version": "Default random player",
                  "stack": 1590,
                  "bet": 80,
                  "hole_cards": [
                      {
                          "rank": "6",
                          "suit": "hearts"
                      },
                      {
                          "rank": "A",
                          "suit": "spades"
                      }
                  ]
              },
              {
                  "id": 2,
                  "name": "Chuck",
                  "status": "out",
                  "version": "Default random player",
                  "stack": 0,
                  "bet": 0
              }
          ],
          "community_cards": []
      }
      end

      it "calls" do
        expect(subject.bet_request(game_state)).to eq(480)
      end
    end

    context "flush" do
      let(:game_state) do
        {
          "tournament_id":"550d1d68cd7bd10003000003",
          "game_id":"550da1cb2d909006e90004b1",
          "round":0,
          "bet_index":0,
          "small_blind": 10,
          "current_buy_in": 320,
          "pot": 400,
          "minimum_raise": 240,
          "dealer": 1,
          "orbits": 7,
          "in_action": 1,
          "players": [
              {
                  "id": 0,
                  "name": "Albert",
                  "status": "active",
                  "version": "Default random player",
                  "stack": 1010,
                  "bet": 320
              },
              {
                  "id": 1,
                  "name": "Bob",
                  "status": "active",
                  "version": "Default random player",
                  "stack": 1590,
                  "bet": 80,
                  "hole_cards": [
                      {
                          "rank": "4",
                          "suit": "hearts"
                      },
                      {
                          "rank": "K",
                          "suit": "hearts"
                      }
                  ]
              },
              {
                  "id": 2,
                  "name": "Chuck",
                  "status": "out",
                  "version": "Default random player",
                  "stack": 0,
                  "bet": 0
              }
          ],
          "community_cards": [
              {
                  "rank": "5",
                  "suit": "hearts"
              },
              {
                  "rank": "A",
                  "suit": "hearts"
              },
              {
                  "rank": "6",
                  "suit": "hearts"
              }
          ]
      }
      end

      it "responds raises 200 times small blind" do
        expect(subject.bet_request(game_state)).to eq(480)
      end
    end

    context "agressive opponent" do
      let(:game_state) do
        {
          "tournament_id":"550d1d68cd7bd10003000003",
          "game_id":"550da1cb2d909006e90004b1",
          "round":0,
          "bet_index":0,
          "small_blind": 10,
          "current_buy_in": 320,
          "pot": 400,
          "minimum_raise": 240,
          "dealer": 1,
          "orbits": 7,
          "in_action": 1,
          "players": [
              {
                  "id": 0,
                  "name": "Albert",
                  "status": "active",
                  "version": "Default random player",
                  "stack": 1010,
                  "bet": 320
              },
              {
                  "id": 1,
                  "name": "Bob",
                  "status": "active",
                  "version": "Default random player",
                  "stack": 1590,
                  "bet": 80,
                  "hole_cards": [
                      {
                          "rank": "4",
                          "suit": "hearts"
                      },
                      {
                          "rank": "K",
                          "suit": "spades"
                      }
                  ]
              },
              {
                  "id": 2,
                  "name": "Chuck",
                  "status": "out",
                  "version": "Default random player",
                  "stack": 0,
                  "bet": 0
              }
          ],
          "community_cards": []
      }
      end

      it "responds with call" do
        expect(subject.bet_request(game_state)).to eq(240)
      end
    end

    context "straight" do
      let(:game_state) do
        {
          "tournament_id":"550d1d68cd7bd10003000003",
          "game_id":"550da1cb2d909006e90004b1",
          "round":0,
          "bet_index":0,
          "small_blind": 10,
          "current_buy_in": 320,
          "pot": 400,
          "minimum_raise": 240,
          "dealer": 1,
          "orbits": 7,
          "in_action": 1,
          "players": [
              {
                  "id": 0,
                  "name": "Albert",
                  "status": "active",
                  "version": "Default random player",
                  "stack": 1010,
                  "bet": 320
              },
              {
                  "id": 1,
                  "name": "Bob",
                  "status": "active",
                  "version": "Default random player",
                  "stack": 1590,
                  "bet": 80,
                  "hole_cards": [
                      {
                          "rank": "2",
                          "suit": "hearts"
                      },
                      {
                          "rank": "3",
                          "suit": "spades"
                      }
                  ]
              },
              {
                  "id": 2,
                  "name": "Chuck",
                  "status": "out",
                  "version": "Default random player",
                  "stack": 0,
                  "bet": 0
              }
          ],
          "community_cards": [
              {
                  "rank": "5",
                  "suit": "spades"
              },
              {
                  "rank": "4",
                  "suit": "hearts"
              },
              {
                  "rank": "6",
                  "suit": "clubs"
              }
          ]
      }
      end

      it "responds with call" do
        expect(subject.bet_request(game_state)).to eq(480)
      end
    end

    context "agressive opponent and shitty hand" do
      let(:game_state) do
        {
          "tournament_id":"550d1d68cd7bd10003000003",
          "game_id":"550da1cb2d909006e90004b1",
          "round":0,
          "bet_index":0,
          "small_blind": 10,
          "current_buy_in": 320,
          "pot": 400,
          "minimum_raise": 240,
          "dealer": 1,
          "orbits": 7,
          "in_action": 1,
          "players": [
              {
                  "id": 0,
                  "name": "Albert",
                  "status": "active",
                  "version": "Default random player",
                  "stack": 1010,
                  "bet": 320
              },
              {
                  "id": 1,
                  "name": "Bob",
                  "status": "active",
                  "version": "Default random player",
                  "stack": 1590,
                  "bet": 80,
                  "hole_cards": [
                      {
                          "rank": "4",
                          "suit": "hearts"
                      },
                      {
                          "rank": "2",
                          "suit": "spades"
                      }
                  ]
              },
              {
                  "id": 2,
                  "name": "Chuck",
                  "status": "out",
                  "version": "Default random player",
                  "stack": 0,
                  "bet": 0
              }
          ],
          "community_cards": []
      }
      end

      it "folds" do
        expect(subject.bet_request(game_state)).to eq(0)
      end
    end

    context "agressive opponent and shitty hand, but promising flush" do
      let(:game_state) do
        {
          "tournament_id":"550d1d68cd7bd10003000003",
          "game_id":"550da1cb2d909006e90004b1",
          "round":0,
          "bet_index":0,
          "small_blind": 10,
          "current_buy_in": 320,
          "pot": 400,
          "minimum_raise": 240,
          "dealer": 1,
          "orbits": 7,
          "in_action": 1,
          "players": [
              {
                  "id": 0,
                  "name": "Albert",
                  "status": "active",
                  "version": "Default random player",
                  "stack": 1010,
                  "bet": 320
              },
              {
                  "id": 1,
                  "name": "Bob",
                  "status": "active",
                  "version": "Default random player",
                  "stack": 1590,
                  "bet": 80,
                  "hole_cards": [
                      {
                          "rank": "4",
                          "suit": "hearts"
                      },
                      {
                          "rank": "2",
                          "suit": "hearts"
                      }
                  ]
              },
              {
                  "id": 2,
                  "name": "Chuck",
                  "status": "out",
                  "version": "Default random player",
                  "stack": 0,
                  "bet": 0
              }
          ],
          "community_cards": []
      }
      end

      it "folds" do
        expect(subject.bet_request(game_state)).to eq(240)
      end
    end

    context "agressive opponent and shitty hand, but promising straight" do
      let(:game_state) do
        {
          "tournament_id":"550d1d68cd7bd10003000003",
          "game_id":"550da1cb2d909006e90004b1",
          "round":0,
          "bet_index":0,
          "small_blind": 10,
          "current_buy_in": 320,
          "pot": 400,
          "minimum_raise": 240,
          "dealer": 1,
          "orbits": 7,
          "in_action": 1,
          "players": [
              {
                  "id": 0,
                  "name": "Albert",
                  "status": "active",
                  "version": "Default random player",
                  "stack": 1010,
                  "bet": 320
              },
              {
                  "id": 1,
                  "name": "Bob",
                  "status": "active",
                  "version": "Default random player",
                  "stack": 1590,
                  "bet": 80,
                  "hole_cards": [
                      {
                          "rank": "4",
                          "suit": "hearts"
                      },
                      {
                          "rank": "3",
                          "suit": "spades"
                      }
                  ]
              },
              {
                  "id": 2,
                  "name": "Chuck",
                  "status": "out",
                  "version": "Default random player",
                  "stack": 0,
                  "bet": 0
              }
          ],
          "community_cards": []
      }
      end

      it "folds" do
        expect(subject.bet_request(game_state)).to eq(240)
      end
    end

    context "three of a kind" do
      let(:game_state) do
        {
          "tournament_id":"550d1d68cd7bd10003000003",
          "game_id":"550da1cb2d909006e90004b1",
          "round":0,
          "bet_index":0,
          "small_blind": 100,
          "current_buy_in": 320,
          "pot": 400,
          "minimum_raise": 240,
          "dealer": 1,
          "orbits": 7,
          "in_action": 1,
          "players": [
              {
                  "id": 0,
                  "name": "Albert",
                  "status": "active",
                  "version": "Default random player",
                  "stack": 1010,
                  "bet": 30
              },
              {
                  "id": 1,
                  "name": "Bob",
                  "status": "active",
                  "version": "Default random player",
                  "stack": 1590,
                  "bet": 80,
                  "hole_cards": [
                      {
                          "rank": "4",
                          "suit": "hearts"
                      },
                      {
                          "rank": "K",
                          "suit": "spades"
                      }
                  ]
              },
              {
                  "id": 2,
                  "name": "Chuck",
                  "status": "out",
                  "version": "Default random player",
                  "stack": 0,
                  "bet": 0
              }
          ],
          "community_cards": [
              {
                  "rank": "4",
                  "suit": "spades"
              },
              {
                  "rank": "4",
                  "suit": "hearts"
              },
              {
                  "rank": "6",
                  "suit": "clubs"
              }
          ]
      }
      end

      it "responds with call" do
        expect(subject.bet_request(game_state)).to eq(1240)
      end
    end

    context "straight flush" do
      let(:game_state) do
        {
          "tournament_id":"550d1d68cd7bd10003000003",
          "game_id":"550da1cb2d909006e90004b1",
          "round":0,
          "bet_index":0,
          "small_blind": 100,
          "current_buy_in": 320,
          "pot": 400,
          "minimum_raise": 240,
          "dealer": 1,
          "orbits": 7,
          "in_action": 1,
          "players": [
              {
                  "id": 0,
                  "name": "Albert",
                  "status": "active",
                  "version": "Default random player",
                  "stack": 1010,
                  "bet": 30
              },
              {
                  "id": 1,
                  "name": "Bob",
                  "status": "active",
                  "version": "Default random player",
                  "stack": 1590,
                  "bet": 80,
                  "hole_cards": [
                      {
                          "rank": "4",
                          "suit": "hearts"
                      },
                      {
                          "rank": "5",
                          "suit": "hearts"
                      }
                  ]
              },
              {
                  "id": 2,
                  "name": "Chuck",
                  "status": "out",
                  "version": "Default random player",
                  "stack": 0,
                  "bet": 0
              }
          ],
          "community_cards": [
              {
                  "rank": "8",
                  "suit": "hearts"
              },
              {
                  "rank": "7",
                  "suit": "hearts"
              },
              {
                  "rank": "6",
                  "suit": "hearts"
              }
          ]
      }
      end

      it "responds with call" do
        expect(subject.bet_request(game_state)).to eq(1590)
      end
    end

    context "promising flush" do
      let(:game_state) do
        {
          "tournament_id":"550d1d68cd7bd10003000003",
          "game_id":"550da1cb2d909006e90004b1",
          "round":0,
          "bet_index":0,
          "small_blind": 10,
          "current_buy_in": 320,
          "pot": 400,
          "minimum_raise": 240,
          "dealer": 1,
          "orbits": 7,
          "in_action": 1,
          "players": [
              {
                  "id": 0,
                  "name": "Albert",
                  "status": "active",
                  "version": "Default random player",
                  "stack": 1010,
                  "bet": 320
              },
              {
                  "id": 1,
                  "name": "Bob",
                  "status": "active",
                  "version": "Default random player",
                  "stack": 1590,
                  "bet": 80,
                  "hole_cards": [
                      {
                          "rank": "4",
                          "suit": "hearts"
                      },
                      {
                          "rank": "2",
                          "suit": "hearts"
                      }
                  ]
              },
              {
                  "id": 2,
                  "name": "Chuck",
                  "status": "out",
                  "version": "Default random player",
                  "stack": 0,
                  "bet": 0
              }
          ],
          "community_cards": [
            {
                "rank": "8",
                "suit": "hearts"
            },
            {
                "rank": "7",
                "suit": "spades"
            },
            {
                "rank": "6",
                "suit": "hearts"
            }
        ]
      }
      end

      it "calls" do
        expect(subject.bet_request(game_state)).to eq(240)
      end
    end
  end
end
