class BidsController < ApplicationController
  before_action :job, only: [:destroy, :edit, :update]
  before_action :bid, only: [:destroy, :edit, :update]

  def edit
  end

  def update
  	if @bid.update(bid_params)
  		redirect_to jobs_path(@job, @bid)
  	else
  		render :edit
  	end
  end

  def new
    @job = job.find(params[:job_id])
    @bid = bid.new
  end

  def create
    @job = job.find(params[:job_id])
  	@bid = @job.bids.new(bid_params)

    # @bid = bid.new(bid_params)
    # @bid.job_id = params[:job_id]

  	if @bid.save
  		redirect_to job_path(@job)
  	else
  		render :new
  	end
  end

  def destroy
    @bid = bid.find(params[:id])
  	@bid.destroy
  	redirect_to job_path(@job)
  end

  private

  	def bid_params
  		params.require(:bid).permit(:name)
  	end

  	def job
  		@job = job.find(params[:job_id])
  	end

  	def bid
  		@bid = @job.bids.find(params[:id])
  	end

end
