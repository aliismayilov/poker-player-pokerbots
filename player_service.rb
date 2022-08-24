require 'sinatra'
require 'json'
require 'active_support'
require_relative 'player'

set :port, 8090
set :bind, '0.0.0.0'

post "/" do
  if params[:action] == 'bet_request'
    Player.new.bet_request(JSON.parse(params[:game_state]).deep_symbolize_keys).to_s
  elsif params[:action] == 'showdown'
    Player.new.showdown(JSON.parse(params[:game_state]).deep_symbolize_keys)
    'OK'
  elsif params[:action] == 'version'
    Player::VERSION
  elsif params[:action] == "check"
    'OK'
  else
    'OK'
  end
end
