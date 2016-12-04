module API
	class ZombiesController < ApplicationController
		def index
			zombies = Zombie.all
			if weapon = params[:weapon]
				zombies = zombies.where(weapon: weapon)
			end
			render json: zombies, status: 200  #or status: ok
		end
		def create
			zombie = Zombie.create
		end
		def show	
			zombie = Zombie.find(params[:id])	
			render json: zombie, status: 200	
		end	
	end
end