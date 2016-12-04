class ApplicationController < ActionController::Base
	before_action ->{ @remote_ip = request.headers['REMOTE_ADDR'] }	
	protect_from_forgery with: :null_session
end
