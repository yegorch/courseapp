class User < ApplicationRecord
  rolify
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

  has_many :courses

  def to_s
    email 
  end

  def username
    self.email.split(/@/).first
  end

  def online?
    updated_at > 2.minutes.ago
  end

  after_create :assign_default_role

  def assign_default_role
    if User.count == 1
      self.add_role(:admin) if self.roles.blank?
      self.add_role(:teacher)
      self.add_role(:student)
    else
      self.add_role(:student) if self.roles.blank?
      self.add_role(:teacher) #if you want any user to be able to create own courses
    end
  end
end
