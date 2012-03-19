class SamplesController < ApplicationController
  before_filter :get_sample, :only => [ :show, :edit, :update, :destroy ]

  def new
    @title = 'New sample'
    @sample = Sample.new
  end

  def create
    @sample = Sample.new(params[:sample])

    if @sample.save
      flash[:success] = "Sample added!"
      redirect_to @sample
    else
      render 'new'
    end
  end

  def index
    @title = 'Sample listing'
    @samples = Sample.all
  end

  def show
    @title = 'Sample Details'
    @sample = Sample.find(params[:id])
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
    @sample.destroy
    redirect_to samples_path
  end

  private
    
    def get_sample
      @sample = Sample.find(params[:id])
    end
end
