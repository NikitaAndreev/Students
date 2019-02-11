class Task < ApplicationRecord
  dragonfly_accessor :asset
  has_many :images, as: :imageable
  has_many :lessons

  scope :labs, ->{where(:task_type => 'lab').order('cast(num as integer)')}
  scope :practices, ->{where(:task_type => 'practice').order('cast(num as integer)')}


end