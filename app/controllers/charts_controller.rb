class ChartsController < ApplicationController
  
  def index
    @samples = Sample.asc(:taken_on)

    gon.tsh_samples = separate_samples_for(@samples, :tsh)
    gon.t3_samples = separate_samples_for(@samples, :t3)
    gon.t4_samples = separate_samples_for(@samples, :t4)
  end

  private

    def separate_samples_for(samples, field)
      separated_samples = []

      samples.each do |sample|
        separated_samples << [(sample[:taken_on].to_i * 1000), sample[field]]
      end

      separated_samples
    end
end
