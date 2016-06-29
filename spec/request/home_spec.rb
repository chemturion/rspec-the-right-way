require 'rails_helper'

describe "Home Page" do

  describe "GET /" do

    context "empty database" do

      before(:each) { visit '/'  }

      it 'render success' do
        expect(page.status_code).to be 200
      end

      it 'populates title' do
        expect(page).to have_title ""
      end

      describe "masthead" do

        it 'displays title' do
          expect(page).to have_selector 'h1', text: "Comments Dashboard"
        end

        it 'displays subtitle' do
          expect(page).to have_selector 'h2', text: "Read comments from your favorite blogs."
        end
      end

    end

    context "populated database" do

      fixtures :blogs

      before(:each) { visit '/'  }


      it 'show a list of blogs' do
        expect(page).to have_selector 'li a', text: 'Mashable'
      end
    end

  end



  describe "POST /blogs" do

    before :each do 
      stub_network

      visit '/'
      fill_in "Blog title", with: "Example"
      fill_in "Comments feed url", with: "http://example.com/comments/feed"
      click_on "Create"
    end

    let(:blog) { Blog.find_by(permalink: 'example') }

    it 'creates a valid record' do
      expect(blog).to be_valid
    end

  end

end
