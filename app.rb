require 'sinatra/base'
require_relative 'lib/player'

class Battle < Sinatra::Base
  enable :sessions

  get '/' do
    erb(:index)
  end

  post '/names' do
    session[:player_1] = params[:player_1]
    session[:player_2] = params[:player_2]
    redirect '/play'
  end

  get '/play' do
    @player_1 = Player.new(session[:player_1])
    @player_2 = Player.new(session[:player_2])
    erb(:play)
  end

  run! if app_file == $0
end
