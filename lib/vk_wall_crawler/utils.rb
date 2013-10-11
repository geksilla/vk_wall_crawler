module VkWallCrawler
  module Utils

    def get_id(link)
      response = http_client.get(link).body
      return response.match(/"user_id":\d+/)[0].split(":")[1] if response.match(/"user_id":\d+/)
      return '-'+response.match(/"group_id":\d+/)[0].split(":")[1] if response.match(/"group_id":\d+/)
    end

  end
end