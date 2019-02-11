class Document < ApplicationRecord
  dragonfly_accessor :asset
  has_many :images, as: :imageable

  default_scope -> {order(:id)}

end