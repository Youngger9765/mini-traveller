class TravellersController < ApplicationController
	def index
  		@travellers = Traveller.all
	end

end
