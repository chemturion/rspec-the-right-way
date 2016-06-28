class Blog < ActiveRecord::Base

  validates :title, presence: true, uniqueness: true
  validates :comments_feed_url, presence: true, uniqueness: true

  has_many :comments do

    def refresh
      comments_feed_url = proxy_association.owner.comments_feed_url
      comment_data = Wordpress::Comments::Client.new(comments_feed_url).fetch
      create_from_wordpress_client_attributes comment_data
    end

    def create_from_wordpress_client_attributes comment_data
      comment_data.map do |a_comment|
        attributes = a_comment.dup
        attributes[:opined_at] = attributes.delete(:date)
        comment = new(attributes)
        if comment.save!
          comment
        end
      end
    end
      
  end

  before_validation :build_permalink, on: :create

  def build_permalink
    if self.title
      self.permalink = self.title.parameterize
    end
  end

end
