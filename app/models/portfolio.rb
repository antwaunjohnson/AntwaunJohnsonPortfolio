class Portfolio < ApplicationRecord
  has_many :technologies, dependent: :destroy
  accepts_nested_attributes_for :technologies,
                                reject_if: lambda { |attrs| attrs['name'].blank?}

  validates_presence_of :title,:body
  
  mount_uploader :thumb_image, PortfolioUploader
  mount_uploader :main_image, PortfolioUploader

  def self.html5css3
    where(subtitle: 'HTML5 / CSS3')
  end

  def self.by_position
    order("position ASC")
  end

  scope :ruby_on_rails, -> {  where(subtitle: 'Ruby on Rails')}

  def set_defaults
  end
end
