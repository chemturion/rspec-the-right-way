require 'rails_helper'

RSpec.describe Blog, type: :model do

  let(:blog) { Blog.new(Factory.blog_attributes) }


  describe "attributes" do
    # title validations
    it { expect(blog).to validate_presence_of(:title) }
    it { should validate_uniqueness_of :title  }
    # comments_feed_url validations
    it { should validate_presence_of :comments_feed_url }
    it { should validate_uniqueness_of :comments_feed_url }
    # comments validations
    it { should have_many :comments  }
    # Expecting to be able to save the blog
    it 'saves attributes' do
      blog.save
      expect(blog).to be_valid
    end
  end

  describe "permalink" do
    it "builds from title" do
      blog.build_permalink
      expect(blog.build_permalink).to eq "my-blog"
    end
  end

  describe 'refresh comments' do
    it 'populates comments' do
      stub_network
      blog.save
      blog.comments.refresh
      expect(blog.comments.length).to eq 8
    end
  end
  
end
