class Tracksegment < ActiveRecord::Base
  belongs_to :track
  has_many :points, :dependent => :destroy
  # attr_accessor :title, :body
end
