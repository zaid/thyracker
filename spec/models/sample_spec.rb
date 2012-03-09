require 'spec_helper'

describe Sample do
  before(:each) do
    @attr = {
      taken_on: "2012-03-08",
      tsh: 3.4,
      t3: 6.2,
      t4: 2.2,
    }
  end

  it "should create a sample given valid attributes" do
    Sample.create!(@attr)
  end

  context "validations" do

    it "should require a 'taken_on' value" do
      no_taken_on_sample = Sample.new(@attr.merge(taken_on: ''))
      no_taken_on_sample.should_not be_valid
    end

    it "should require a 'tsh' value" do
      no_tsh_sample = Sample.new(@attr.merge(tsh: ''))
      no_tsh_sample.should_not be_valid
    end

    it "should require a 't3' value" do
      no_t3_sample = Sample.new(@attr.merge(t3: ''))
      no_t3_sample.should_not be_valid
    end

    it "should require a 't4' value" do
      no_t4_sample = Sample.new(@attr.merge(t4: ''))
      no_t4_sample.should_not be_valid
    end
  end
end
