class StreamsNamesValidator < ActiveModel::Validator
  def validate(record)
    unless record.streams_names.split(' ').all? { |name| Stream.new(:name => name).valid? }
      record.errors[:streams_names] << ' is too short (minimum is 3 characters)'
    end
  end
end