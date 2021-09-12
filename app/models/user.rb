class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable, :confirmable

  def to_s
    email 
  end

  def username
    self.email.split(/@/).first
  end

  has_many :courses
end
