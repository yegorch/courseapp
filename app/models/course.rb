class Course < ApplicationRecord
  has_rich_text :description

  validates :title, presence: true
  validates :description, presence: true, length: { :minimum => 5 }

  belongs_to :user

  extend FriendlyId
  friendly_id :title, use: :slugged

  friendly_id :generated_slug, use: :slugged

  def to_s
    title
  end
end
