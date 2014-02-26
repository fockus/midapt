require 'spec_helper'

describe Mind do
  it "validates its topic and makes sure that it isn't nil" do
    mind_nil = Mind.new(question: nil)

    mind_nil.valid?

    mind_nil.errors[:question].should_not be_empty
  end

  it "validates its topic and makes sure that it's consisted of 5-100 symbols" do
    mind_4 = Mind.new(question: '@' * 4 )
    mind_5 = Mind.new(question: '@' * 5 )
    mind_100 = Mind.new(question: '@' * 100 )
    mind_1001 = Mind.new(question: '@' * 101 )


    mind_4.valid?
    mind_5.valid?
    mind_100.valid?
    mind_1001.valid?

    mind_4.errors[:question].should_not be_empty
    mind_5.errors[:question].should be_empty
    mind_100.errors[:question].should be_empty
    mind_1001.errors[:question].should_not be_empty
  end

  it "validates its text and makes sure that it isn't nil" do
    mind_nil = Mind.new(text: nil)

    mind_nil.valid?

    mind_nil.errors[:text].should_not be_empty
  end

  it "validates its text and makes sure that it's consisted of 5-1000 symbols" do
    mind_4 = Mind.new(text: '@' * 4 )
    mind_5 = Mind.new(text: '@' * 5 )
    mind_1000 = Mind.new(text: '@' * 1000 )
    mind_1001 = Mind.new(text: '@' * 1001 )


    mind_4.valid?
    mind_5.valid?
    mind_1000.valid?
    mind_1001.valid?

    mind_4.errors[:text].should_not be_empty
    mind_5.errors[:text].should be_empty
    mind_1000.errors[:text].should be_empty
    mind_1001.errors[:text].should_not be_empty
  end
end