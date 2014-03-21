class Mind < ActiveRecord::Base
  belongs_to :user

  has_many :comments
  has_many :marks, as: :markable

  has_many :mind_streams, inverse_of: :mind, :dependent => :destroy
  has_many :streams, through: :mind_streams

  def streams_names
    @streams_names ||= self.streams.nil? ? '' : self.streams.collect(&:name).join(' ')
  end

  attr_writer :streams_names

  validates :title,
            length: {in: 5..100}, allow_blank: true

  validates :text,
            presence: true,
            length: {in: 5..1000}

  validates_with StreamsNamesValidator

  def assign_streams
    new_names = @streams_names.split(' ')
    self.streams.each do |stream|
      self.streams.delete stream if new_names.index { |s| s == stream.name }.nil?
    end
    new_names.each do |stream_name|
      if self.streams.index { |s| s.name == stream_name }.nil?
        stream = Stream.where(name: stream_name).first
        self.streams.push(stream.nil? ? Stream.new(:name => stream_name) : stream)
      end
    end
  end

end


