require 'nokogiri'
require 'open-uri'

module Wordpress
  module Comments
    class Client

      attr_reader :url

      def initialize url
        @url = url
      end

      def fetch
        xml = get @url
        parse xml
      end

      def parse xml
        doc = Nokogiri::XML(xml) { |config| config.strict }
        doc.search('item').map do |doc_item|
          item = {}
          item[:link] = doc_item.at('link').text
          item[:title] = doc_item.at('title').text
          item[:commenter] = doc_item.xpath('dc:creator').text
          item[:date] = DateTime.parse doc_item.at('pubDate').text
          item
        end
      end

      private

      def get url
        open url
      end
      
    end
  end
end
