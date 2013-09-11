module VkWallCrawler
  module Search
    extend VkWallCrawler::Adapter

    class << self

      DEFAULTS = { section: 'statuses', offset: 0 }
      URL = 'al_search.php'
      attr_accessor :data

      def fetch(options={})
        raise "VkWallCrawler::Exception 'Set cookies with remixsid key'" unless VkWallCrawler.faraday_config.include?('headers["Cookie"]')
        @data = []
        @vk = VkontakteApi::Client.new
        options.merge!(DEFAULTS) { |key, v1, v2| v1 }
        options = format_query options
        loop do
          response = client.post(URL, options).body
          raise "VkWallCrawler::Exception 'Query error or check your remixsid cookie'" if response.length < 100
          matches = response.scan(/(id="wpt(?<id>(-|)\d+_\d+)")/i).flatten
          if matches.length > 0
            @data.concat(@vk.wall.getById(posts: matches*','))
          else
            break
          end
          break if response.scan(/"has_more":false/).length > 0
          options[:offset] +=40
        end
        @data
      end

      def format_query(hash)
        formatted = {}
        formatted[:al] = 1
        hash.each do |key, value|
          unless key.to_s.index(/offset/)
            formatted["c[#{key}]".to_sym] = value
          else
            formatted[key] = value
          end
        end
        formatted
      end

    end
  end
end