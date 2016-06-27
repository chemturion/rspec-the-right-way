require 'nokogiri'
require 'open-uri'
module Wordpress
  module Comments

    class Client
      attr_accessor :url

      def initialize url
        @url = url
      end

      def parse xml
        doc = Nokogiri::XML(xml) { |config| config.strict } 
        doc.search('item').map do |doc_item|
          item={}
          item[:link] = doc_item.at('link').text
          item[:title] = doc_item.at('title').text
          item[:description] = doc_item.at('description').text
          item[:date] = DateTime.parse doc_item.at('pubDate').text
          item
        end
      end

      def fetch
        xml = get @url
        parse xml
      end

      private

      def get url
        open url
      end

    end

  end
end
