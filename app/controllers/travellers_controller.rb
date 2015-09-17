class TravellersController < ApplicationController
	def index
  		@travellers = Traveller.page(params[:page]).per(5)
	end


	def new
		@traveller = Traveller.new
	end

	def create
  		@traveller = Traveller.new(traveller_params)
  		if @traveller.save
			redirect_to travellers_url
      		flash[:notice] = "新增成功的訊息"
    	else
      		render :action => :new
		end
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

      		redirect_to traveller_url(@traveller)
      		flash[:notice] = "event was successfully updated"
    	else
      		render :action => :edit
    	end
	end

	def destroy
  		@traveller = Traveller.find(params[:id])
  		@traveller.destroy

  		redirect_to :action => :index
  		flash[:notice] = "successfully deleted"
	end



	private

	def traveller_params
  		params.require(:traveller).permit(:city, :date, :note)
	end

end
