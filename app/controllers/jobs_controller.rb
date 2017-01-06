class JobsController < ApplicationController
	before_action :job, except: [:new, :create, :index]

  def index
  flash[:success] = "You have been signed in"
 	@jobs = current_user.jobs
  @jobs = job.paginate(page: params[:page], per_page: 4)

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
  		params.require(:job).permit(:category, :bids)

  	end

  	def job
  		@job = job.find(params[:id])
  	end


end
