require 'spec_helper'

describe Stream do
  it "validates its name and makes sure that it isn't nil" do
    stream_nil = Stream.new(name: nil)

    stream_nil.valid?

    stream_nil.errors[:name].should_not be_empty
  end

  it "validates its name and makes sure that it's consisted of 3-120 symbols" do
    stream_2 = Stream.new(name: '@' * 2 )
    stream_3 = Stream.new(name: '@' * 3 )
    stream_120 = Stream.new(name: '@' * 120 )
    stream_121 = Stream.new(name: '@' * 121 )


    stream_2.valid?
    stream_3.valid?
    stream_120.valid?
    stream_121.valid?

    stream_2.errors[:name].should_not be_empty
    stream_3.errors[:name].should be_empty
    stream_120.errors[:name].should be_empty
    stream_121.errors[:name].should_not be_empty
  end
end