class JobsController < ApplicationController
	before_action :job, except: [:new, :create, :index]

  def index
  	flash[:success] = "You have been signed in"
		if params[:search]
	    @jobs = Job.search(params[:search]).order("created_at DESC")
	  else
	    @jobs = Job.all.order("created_at DESC").paginate(page: params[:page], per_page: 4)
	  end
	end

  def new
  	@job = current_user.jobs.new
  end

  def create
  	@job = current_user.jobs.new(job_params)
  	if @job.save
  		redirect_to jobs_path
  	else
  		render :new
  	end
  end

  def show
    @bids = @job.bids
    @bids = @job.bids.paginate(page: params[:page], per_page: 4)
  end

  def edit
  end

  def update
    @job = job.find(params[:id])
    if @job.update(job_params)
      redirect_to jobs_path
    else
      render :edit
    end
  end

  def destroy
  	@job.destroy
  	redirect_to jobs_path
  end

  private

  	def job_params
  		params.require(:job).permit(:pickup_location, :dropoff_location, :pickup_date,
			                            :dropoff_date, :description, :special_notes, :delivered)
  	end

  	def job
  		@job = Job.find(params[:id])
  	end

		def bid
			@bid = Job.bid.find(params[:id])
		end

		def address
			@address = Job.address.find(params[:id])
		end

		def address_params
			params.require(:address).permit(:alias, :address_1, :address_2, :address_3,
																			:province, :country, :zip)
		end
		
end
