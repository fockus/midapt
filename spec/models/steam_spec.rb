require 'spec_helper'

describe Stream do

  it "validates its name and makes sure that it's consisted of 3-120 symbols" do
    stream_nil_name= Stream.new(name: nil)
    stream_short_name = Stream.new(name: Forgery(:basic).text(:at_least => 1, :at_most => 2) )
    stream_valid_name = Stream.new(name: Forgery(:basic).text(:at_least => 3, :at_most => 30) )
    stream_long_name = Stream.new(name: Forgery(:basic).text(:at_least => 31, :at_most => 100) )


    stream_nil_name.valid?
    stream_short_name.valid?
    stream_valid_name.valid?
    stream_long_name.valid?

    stream_nil_name.errors[:name].should_not be_empty
    stream_short_name.errors[:name].should_not be_empty
    stream_valid_name.errors[:name].should be_empty
    stream_long_name.errors[:name].should_not be_empty
  end
end