class SamplesController < ApplicationController
  before_filter :authenticate
  before_filter :get_sample, :only => [ :show, :edit, :update, :destroy ]

  def new
    @title = 'New sample'
    @sample = current_user.samples.new
  end

  def create
    @sample = current_user.samples.new(params[:sample])

    if @sample.save
      flash[:success] = "Sample added!"
      redirect_to @sample
    else
      render 'new'
    end
  end

  def index
    @title = 'Sample listing'
    @samples = current_user.samples.all
  end

  def show
    @title = 'Sample Details'
  end

  def edit
    @title = 'Update sample'
  end

  def update
    if @sample.update_attributes(params[:sample])
      flash[:success] = "Sample updated!"
      redirect_to(@sample)
    else
      render 'edit'
    end
  end

  def destroy
    current_user.samples.where(_id: @sample.id).destroy
    redirect_to samples_path
  end

  private
    
    def get_sample
      @sample = current_user.samples.find(params[:id])
    end
end
