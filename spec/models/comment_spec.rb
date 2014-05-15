require 'spec_helper'

describe Comment do
  describe 'message' do
    context 'when valid' do
      it 'should accept valid message' do
        comment_valid_message = Comment.new(message: FactoryGirl.generate(:valid_comment_message))

        comment_valid_message.valid?

        comment_valid_message.errors[:message].should be_empty
      end
    end

    context 'when invalid' do
      it 'should reject nil message' do
        comment_nil = Comment.new(message: nil)

        comment_nil.valid?

        comment_nil.errors[:message].should_not be_empty
      end

      it 'should reject short message' do
        comment_short_message = Comment.new(message: FactoryGirl.generate(:short_comment_message))

        comment_short_message.valid?

        comment_short_message.errors[:message].should_not be_empty
      end

      it 'should reject long message' do
        comment_long_message = Comment.new(message: FactoryGirl.generate(:long_comment_message))

        comment_long_message.valid?

        comment_long_message.errors[:message].should_not be_empty
      end
    end
  end
end