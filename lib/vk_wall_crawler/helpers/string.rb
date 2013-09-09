class String
  def to_id
    client = VkWallCrawler::Adapter.client
    response = client.get(self).body
    return response.match(/"user_id":\d+/)[0].split(":")[1] if response.match(/"user_id":\d+/)
    return '-'+response.match(/"group_id":\d+/)[0].split(":")[1] if response.match(/"group_id":\d+/)
  end
end