class TravellersController < ApplicationController
	
	before_action :set_traveller, :only =>[ :show, :update, :destroy]
	def index
  		#@travellers = Traveller.page(params[:page]).per(5)
  		#如果要做 id 遞降
  		@travellers = Traveller.order("id DESC").page(params[:page]).per(5)
		
  		if params[:traveller_id]
  			@traveller = Traveller.find( params[:traveller_id] )
  		else
			@traveller = Traveller.new
  		end

  		respond_to do |format|
    		format.html # index.html.erb
    		format.xml { render :xml => @events.to_xml }
    		format.json { render :json => @events.to_json }
    		format.atom { @feed_title = "My event list" } # index.atom.builder
  		end

	end


	

	def create
  		@traveller = Traveller.new(traveller_params)
  		if @traveller.save
			redirect_to travellers_path
      		flash[:notice] = "新增成功的訊息"
    	else
      		@travellers = Traveller.order("id DESC").page(params[:page]).per(5)
      		flash[:alert] = "新增失敗的訊息"
      		render "index"
		end
	end

	def show
		
		respond_to do |format| 
			format.html { @page_title = @traveller.city } # show.html.erb 
			format.xml # show.xml.builder 
			format.json { render :json => { id: @traveller.id, city: @traveller.city }.to_json } 
		end

	end



	def update
		

		if @traveller.update(traveller_params)

      		redirect_to travellers_path
      		flash[:notice] = "event was successfully updated"
    	else
      		@travellers = Traveller.order("id DESC").page(params[:page]).per(5)
      		render "index"
    	end
	end

	def destroy
  		
  		@traveller.destroy

  		redirect_to :back
  		flash[:alert] = "successfully deleted"
	end



	private
	def set_traveller
		@traveller = Traveller.find(params[:id])
	end



	def traveller_params
  		params.require(:traveller).permit(:city, :date, :note)
	end

end
