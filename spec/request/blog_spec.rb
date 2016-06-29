require 'spec_helper'

describe "Blogs detail" do

  describe "GET /blogs/:id" do

    fixtures :blogs

    before(:each) do
      blog = blogs(:mashable)
      Factory.create_comments blog
      visit '/blogs/mashable'
    end

    it 'responds with success' do
      expect(page.status_code).to be 200
    end

    describe "individual comment" do

      it 'renders a link to the comment' do
        link_text = "What if you could 3-D print hair?"
        expect(page).to have_selector 'div.comment p a', text: link_text
      end

    end

  end

end
