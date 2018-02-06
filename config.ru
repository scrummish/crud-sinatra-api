require 'sinatra/base'
require 'sinatra/activerecord'

# controllers
require './controllers/ApplicationController'

# models
require './models/GameModel'

# routes
map('/') {
	run ApplicationController
}