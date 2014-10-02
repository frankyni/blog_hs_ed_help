require 'sinatra'
require 'sinatra/activerecord'
require 'bundler/setup'
require 'sinatra/base'
require 'rack-flash'
require './models.rb'

set :database, "sqlite3:example.sqlite3"

enable :sessions
use Rack::Flash, :sweep => true
set :sessions => true

get '/' do
  erb :landing
end

get '/home' do
  erb :home
end

get '/profile' do
  erb :profile
end

get '/settings' do
  erb :settings
end

helpers do
  def current_user
    session[:user_id].nil? ? nil : User.find(session[:user_id])
  end
end

