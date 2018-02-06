class ApplicationController < Sinatra::Base

	require 'bundler'
	Bundler.require()

	ActiveRecord::Base.establish_connection(
 		:adapter => 'postgresql', 
 		:database => 'videogame'
	)

	# Create Route
	post '/' do
		@game = Game.new
		@game.title = params[:title]
		@game.developer = params[:developer]
		@game.genre = params[:genre]
		@game.save
		resp = {
			status: {
				created: true
			},
			game: @game
		}
		resp.to_json
	end

	# Read Route
	get '/:id' do
		@game = Game.find params[:id]
		resp = {
			status: {
				found: true,
				message: "Game found"
			},
			game: @game
		}
		resp.to_json
	end

	# Update/Edit Route
	patch '/:id' do
		@game = Game.find params[:id]
		@game.title = params[:title]
		@game.developer = params[:developer]
		@game.genre = params[:genre]
		@game.save

		resp = {
			status: {
				updated: true,
				message: "updated #{@game.title}"
			},
			game: @game
		}
		resp.to_json
	end

	# Destroy/Delete Route
	delete '/:id' do
		@game = Game.find params[:id]
		@game.delete

		resp = {
			status: {
				deleted: true
			}
		}
		resp.to_json
	end

end