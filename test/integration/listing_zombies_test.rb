require 'test_helper'

class ListingZombiesTest < ActionDispatch::IntegrationTest	
	setup { host! 'api.zombies.com' }	

	test 'returns zombies filtered by weapon' do	
		get '/zombies.json?weapon=axe'	
		assert_equal 200, response.status	
		zombies = JSON.parse(response.body, symbolize_names: true)
		names = zombies.collect { |z| z[:name] }	
		assert_includes names, 'John'	
		refute_includes names, 'Joanna'	
	end	
	test 'returns zombies in JSON' do	
		get '/zombies', {}, { 'Accept' => Mime[:json] }	
		assert_equal 200, response.status	
		assert_equal Mime[:json], response.content_type
	end
	test 'returns zombies in XML' do	
		get '/zombies', {}, { 'Accept' => Mime[:xml] }
		assert_equal 200, response.status	
		assert_equal Mime[:xml], response.content_type
	end	
end