class ListingZombiesTest < ActionDispatch::IntegrationTest	
	setup { host! 'api.example.com' }	

	test 'returns zombies filtered by weapon' do	
		john = Zombie.create!(name: 'John', weapon: 'axe')	
		joanna = Zombie.create!(name: 'Joanna', weapon: 'shotgun')
		get '/zombies?weapon=axe'	
		assert_equal 200, response.status	
		zombies = JSON.parse(response.body, symbolize_names: true)
		names = zombies.collect { |z| z[:name] }	
		assert_includes names, 'John'	

		refute_includes names, 'Joanna'	
	end	
end