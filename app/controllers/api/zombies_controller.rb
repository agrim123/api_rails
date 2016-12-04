module API
	class ZombiesController < ApplicationController
		before_action :authenticate
		def index
			zombies = Zombie.all
			if weapon = params[:weapon]
				zombies = zombies.where(weapon: weapon)
			end
			 render json: zombies, status: 200 
			 #  add this for ip addr"#{@remote_ip} Version Two!"
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
		def update
			zombie = Zombie.find(params[:id])
			if zombie.update(zombie_params)
				render json: zombie, status: 200
			else
				render json: zombie.errors, status: 422
			end
		end
		def show	
			zombie = Zombie.find(params[:id])	
			render json: zombie, status: 200	
		end	
		def destroy	
			zombie = Zombie.find(params[:id])	
			zombie.destroy	
			head 204	
		end	
		private
		def zombie_params
			params.require(:zombie).permit(:name,:weapon)
		end
		protected
		def authenticate	
			authenticate_basic_auth || render_unauthorized	
		end	

		def authenticate_basic_auth	
			authenticate_with_http_basic do |username, password|
				#User.authenticate(username, password)	
				username == 'admin' && password == 'password'
			end	
		end
		def render_unauthorized	
			self.headers['WWW-Authenticate'] = 'Basic realm="Zombies"'	
			render json: 'Bad credentials', status: 401
		end		
	end
end