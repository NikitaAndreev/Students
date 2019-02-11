class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :group_users
  has_many :groups, through: :group_users
  has_many :lessons
  has_many :images

  ROLE = %w(admin teacher trainee student)

  default_scope ->{order(:family)}
  scope :students, ->{where(role: 'student')}

  def admin?
    role.eql?('admin')
  end

  def teacher?
    role.eql?('teacher')
  end

  # практикант
  def trainee?
    role.eql?('trainee')
  end

  def student?
    role.eql?('student')
  end

  def fio
    unless family.blank?
      "#{family} #{name} #{last_name}"
    else
      email.partition('@').first
    end
  end

  def fio_short
    unless family.blank?
      "#{family} #{name ? name[0] : ''}. #{last_name ? last_name[0] : ''}."
    else
      email.partition('@').first
    end
  end

end
