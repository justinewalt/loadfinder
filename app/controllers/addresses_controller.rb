class AddressesController < ApplicationController
  before_action :load_addressable

  def index
    @addressable = Job.find(params[:job_id])
    @addresses = @addressable.addresses
  end

  def new
    @address = @addressable.addresses.new
  end

  def create
    @address = @addressable.addresses.new(allowed_params)
    if @address.save
      redirect_to [@addressable, :addresses], notice: 'Comment created'
    else
      render :new
    end
  end

  private

    def load_addressable
      resource, id = request.path.split('/')[1,2]
      @addressable = resource.singularize.classify.constantize.find(id)
    end

end
