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

	def edit
		@traveller = Traveller.find( params[:id])
	end

	def update
		@traveller = Traveller.find( params[:id])

		if @traveller.update(traveller_params)
      		redirect_to traveller_path(@traveller)
      		flash[:notice] = "it was successfully updated"
    	else
      		render :action => :edit
    	end
	end



	private

	def traveller_params
  		params.require(:traveller).permit(:city, :date)
	end

end
