require 'spec_helper'

describe Comment do
  it "validates its message and makes sure that it isn't nil" do
    comment_nil = Comment.new(message: nil)

    comment_nil.valid?

    comment_nil.errors[:message].should_not be_empty
  end

  it "validates its message and makes sure that it's consisted of 5-200 symbols" do
    comment_4 = Comment.new(message: '@' * 4 )
    comment_5 = Comment.new(message: '@' * 5 )
    comment_200 = Comment.new(message: '@' * 200 )
    comment_201 = Comment.new(message: '@' * 201 )


    comment_4.valid?
    comment_5.valid?
    comment_200.valid?
    comment_201.valid?

    comment_4.errors[:message].should_not be_empty
    comment_5.errors[:message].should be_empty
    comment_200.errors[:message].should be_empty
    comment_201.errors[:message].should_not be_empty
  end
end