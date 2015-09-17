class TravellersController < ApplicationController
	def index
  		@travellers = Traveller.all
	end


	def new
		@traveller = Traveller.new
	end

	def create
  		@traveller = Traveller.new(traveller_params)
  		@traveller.save

  		redirect_to :action => :index
	end

	def show
		@traveller = Traveller.find( params[:id])
	end


	private

	def traveller_params
  		params.require(:traveller).permit(:city, :date)
	end

end
