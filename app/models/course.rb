class Course < ApplicationRecord
  has_rich_text :description

  validates :title, :short_description, :language, :price, :level, presence: true
  validates :description, presence: true, length: { :minimum => 5 }

  belongs_to :user
  has_many :lessons, dependent: :destroy

  extend FriendlyId
  friendly_id :title, use: :slugged

  friendly_id :generated_slug, use: :slugged

  def generated_slug
    title
  end

  LANGUAGES = [:"English", :"Russian", :"Polish", :"Spanish"]
  def self.languages
    LANGUAGES.map { |language| [language, language] }
  end

  LEVELS = [:"Beginner", :"Intermediate", :"Advanced"]
  def self.levels
    LEVELS.map { |level| [level, level] }
  end

  include PublicActivity::Model
  tracked owner: Proc.new{ |controller, model| controller.current_user }
  
  def to_s
    title
  end
end
