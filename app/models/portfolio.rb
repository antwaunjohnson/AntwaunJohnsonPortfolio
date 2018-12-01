class Portfolio < ApplicationRecord
  validates_presence_of :title,:body, :main_image, :thumb_image

  def self.html5css3
    where(subtitle: 'HTML5 / CSS3')
  end

  scope :ruby_on_rails, -> {  where(subtitle: 'Ruby on Rails')}

  after_initialize :set_defaults

  def set_defaults
    self.main_image ||= "http://placehold.jp/600x400.png"
    self.thumb_image ||= "http://placehold.jp/350x200.png"
  end
end
