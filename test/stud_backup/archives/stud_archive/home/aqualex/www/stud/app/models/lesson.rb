class Lesson < ApplicationRecord
  belongs_to :user
  belongs_to :task

  scope :labs, ->{where(:lesson_type => 'lab').order(:lesson_date)}
  scope :practices, ->{where(:lesson_type => 'practice').order(:lesson_date)}

  scope :lab_dates, ->{where(:lesson_type => 'lab').select(:lesson_date).group(:lesson_date).order(:lesson_date)}
  scope :practice_dates, ->{where(:lesson_type => 'practice').select(:lesson_date).group(:lesson_date).order(:lesson_date)}

  scope :for_group, ->(group_id){joins(user: [:group_users]).where('group_users.group_id=?', group_id)}
end