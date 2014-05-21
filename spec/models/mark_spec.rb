require 'spec_helper'

describe Mark do
  describe 'mark' do
    context 'when valid' do
      it 'should accept valid mark' do
        mark_valid_mark = Mark.new(mark: FactoryGirl.generate(:valid_mark_mark))

        mark_valid_mark.valid?

        mark_valid_mark.errors[:mark].should be_empty
      end
    end

    context 'when invalid' do
      it 'should reject zero mark' do
        mark_zero_mark = Mark.new(mark: FactoryGirl.generate(:zero_mark_mark))

        mark_zero_mark.valid?

        mark_zero_mark.errors[:mark].should_not be_empty
      end

      it 'should reject negative mark' do
        mark_negative_mark = Mark.new(mark: FactoryGirl.generate(:negative_mark_mark))

        mark_negative_mark.valid?

        mark_negative_mark.errors[:mark].should_not be_empty
      end

      it 'should reject positive mark' do
        mark_positive_mark = Mark.new(mark: FactoryGirl.generate(:negative_mark_mark))

        mark_positive_mark.valid?

        mark_positive_mark.errors[:mark].should_not be_empty
      end
    end
  end
end
