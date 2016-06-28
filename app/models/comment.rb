class Comment < ActiveRecord::Base
  belongs_to :blog

  validates :link, uniqueness: true
end
