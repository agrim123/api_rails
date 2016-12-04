module API
	class ZombiesController < ApplicationController
		def index
			zombies = Zombie.all
			render json: zombies, status: 200
		end
		def create
			zombie = Zombie.create
		end
	end
end