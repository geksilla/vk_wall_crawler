module VkWallCrawler
  module Adapter
    USER_AGENT = "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/27.0.1453.116 Safari/537.36"
    def self.client
      Faraday.new(url: 'http://vk.com') do |c|
        c.adapter Faraday.default_adapter
        c.response :logger
        c.request :url_encoded
        c.headers["User-Agent"] = USER_AGENT
      end
    end
  end
end