class Image < ApplicationRecord
  dragonfly_accessor :picture
  belongs_to :user
  belongs_to :imageable, polymorphic: true


end