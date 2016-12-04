module API
	class ZombiesController < ApplicationController
		def index
			zombies = Zombie.all
			if weapon = params[:weapon]
				zombies = zombies.where(weapon: weapon)
			end
			 render json: zombies, status: 200 
=begin
			respond_to do |format|	
				format.json { render json: zombies, status: 200 }
				format.xml { render xml: zombies, status: 200 }
			end 
=end 
		end
		def create
			zombie = Zombie.new(zombie_params)
			if zombie.save
				render json: zombie,status: 201 #,location: zombie
			else
				render json: zombie.errors, status: 422
			end
		end
		def show	
			zombie = Zombie.find(params[:id])	
			render json: zombie, status: 200	
		end	
		private
		def zombie_params
			params.require(:zombie).permit(:name,:weapon)
		end
	end
end