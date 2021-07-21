class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def to_s
    email 
  end

  has_many :courses
end
