require 'sinatra'
require 'sinatra/activerecord'
require 'bundler/setup'
require 'sinatra/base'
require 'rack-flash'
require './models.rb'

# set :database, "sqlite3:example.sqlite3"
enable :sessions
use Rack::Flash, :sweep => true
set :sessions => true
configure(:development){set :database, "sqlite3:example.sqlite3"}

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

post 'profile_create' do
	if params[:confirm_password] == params[:post[:password]]
		@user = User.create(params[:post])
		session[:user_id] = @user.id
		redirect '/home'
		flash[:notice] = "Welcome to Elp!"
	else
		flash[:alert] = "Passwords do not match, please reconfirm password"
		redirect '/'
	end
end

post 'profile_login' do
	@user = User.find_by_email[:email]
	if @user && @user.password == params[:password]
		redirect '/home'
	elsif @user && @user.password != params[:password]
		flash[:alert] = "Incorrect password"
		redirect '/'
	else
		flash[:alert] = "Unknown email"
		redirect '/'
	end
end

helpers do   
  def current_user
    session[:user_id].nil? ? nil : User.find(session[:user_id])
  end
end

