require_relative "../../../../lib/wordpress/comments/client"
describe Wordpress::Comments::Client do

  let(:client) { Wordpress::Comments::Client.new "http://rss.cnn.com/rss/edition_technology.rss" }
  let(:xml) { File.read( File.join("spec", "fixtures", "feed.xml")) }

  describe "#initialize" do

    it "stores a URL" do
      expect(client.url).to eq "http://rss.cnn.com/rss/edition_technology.rss"
    end

  end

  describe "#parse" do

    let(:news_list) { client.parse xml }
    let(:news) { news_list.first }


    it "extracts the link" do
      link = "http://rss.cnn.com/~r/rss/edition_technology/~3/pedBPDAjb4o/index.html"
      expect(news[:link]).to eq link
    end

    it 'extracts the title' do
      title = "What if you could 3-D á print hair?"
      expect(news[:title]).to eq title
    end

    it 'extracts the description' do
      description = "Any number of complicated things can be created in a matter of minutes with 3-D printer technology: weapons, robots, even pizza. But what if you could print hair?"
      expect(news[:description]).to eq description
    end

    it 'extracts the date' do
      # Wed, 22 Jun 2016 13:59:58 EDT
      expect(news[:date].year).to eq 2016
      expect(news[:date].month).to eq 6
      expect(news[:date].day).to eq 22
      expect(news[:date].hour).to eq 13
      expect(news[:date].minute).to eq 59
    end

    it 'extracts the date (redux)' do
      expect(news[:date]).to match_date '2016-06-22'
    end
  end

  describe '#fetch' do

    let(:news_list) { client.fetch }

    context "success" do
      before(:each) do
        # Old, deprecated syntax
        # client.stub(:get).and_return(xml)

        # New syntax
        allow(client).to receive(:get) { xml }
      end

      it 'builds common objects' do
        expect(news_list.length).to eq 8
      end
    end

    context "bad URL" do

      let(:client) { Wordpress::Comments::Client.new 'not a valid URL' }

      it "raises an error" do
        expect {
          client.fetch
        }.to raise_error(Errno::ENOENT)
      end

    end

    context "bad XML" do

      before(:each) { allow(client).to receive(:get) { "BAD XML" } }

      it 'raise error from Nokogiri' do
        expect {
          client.fetch
        }.to raise_error(Nokogiri::XML::SyntaxError)
      end

    end
  end

end
