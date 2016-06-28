module Factory

  class << self
    
    def comments_feed_xml
      File.read(File.join('spec', 'fixtures', 'feed.xml'))
    end

    def blog_attributes
      {
      title: "My blog",
      comments_feed_url: "http://rss.cnn.com/rss/edition_technology.rss"
      }
    end

    def create_comments blog
      stub_network
      blog.comments.refresh
    end

  end

end
