Rails.application.routes.draw do
	namespace :api, path: '/', constraints:{subdomain: 'api'} do
		resources :zombies
		resources :humans
	end

	resources :pages
end
