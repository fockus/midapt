class StreamsNamesValidator < ActiveModel::Validator
  def validate(record)
    unless record.streams_names.split(' ').all? { |name| Stream.new(:name => name).valid? }
      record.errors[:streams_names] << ' are invalid.'
    end
  end
end