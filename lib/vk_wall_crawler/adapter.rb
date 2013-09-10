module VkWallCrawler
  module Adapter
    USER_AGENT = "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/27.0.1453.116 Safari/537.36"
    def self.client
      Faraday.new({url: 'http://vk.com'}) do |c|
        c.response :logger
        c.request :url_encoded
        c.headers["User-Agent"] = USER_AGENT
        # THAT's not good!
        if VkWallCrawler.faraday_config
          VkWallCrawler.faraday_config.each_pair do |key, value|
            eval "c.#{key} = '#{value}'"
          end
        end
        c.adapter Faraday.default_adapter
      end
    end
  end
end