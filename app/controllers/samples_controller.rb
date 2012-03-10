class SamplesController < ApplicationController

  def new
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
    @samples = Sample.all
  end

  def show
    @title = 'Sample Details'
    @sample = Sample.find(params[:id])
  end
end
