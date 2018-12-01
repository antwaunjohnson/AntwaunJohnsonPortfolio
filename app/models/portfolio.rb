class Portfolio < ApplicationRecord
  validates_presence_of :title,:body, :main_image, :thumb_image

  def self.html5css3
    where(subtitle: 'HTML5 / CSS3')
  end

  scope :ruby_on_rails, -> {  where(subtitle: 'Ruby on Rails')}
end
