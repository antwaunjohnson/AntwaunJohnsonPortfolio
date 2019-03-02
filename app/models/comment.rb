class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :blog
  
  validates :content, prsence true:, length: { minimum: 10, maximum: 1000 }
end
