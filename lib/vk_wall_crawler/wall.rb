module VkWallCrawler
  module Wall

    class << self
      attr_accessor :data, :client

      def fetch(owner_id, break_limit = 0)
        owner_id = owner_id.to_id if owner_id.index(/http|vk.com/)
        @client = VkontakteApi::Client.new
        @data = []
        count = 100
        total_pages = (@client.wall.get(owner_id: owner_id.to_i, count: 1).first.to_f/count).ceil
        total_pages.times do |step|
          @wall = @client.wall.get(owner_id: owner_id.to_i, count: count, offset: step*count)
          @wall.each_with_index do |post, index|
            next if index == 0
            break if post.date < break_limit
            hash = {}
            yield(hash, post) if block_given?
            @data.push hash
          end
        end
        @data
      end
    end

  end
end