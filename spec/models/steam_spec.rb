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
    stream_30 = Stream.new(name: '@' * 30 )
    stream_31 = Stream.new(name: '@' * 31 )


    stream_2.valid?
    stream_3.valid?
    stream_30.valid?
    stream_31.valid?

    stream_2.errors[:name].should_not be_empty
    stream_3.errors[:name].should be_empty
    stream_30.errors[:name].should be_empty
    stream_31.errors[:name].should_not be_empty
  end
end