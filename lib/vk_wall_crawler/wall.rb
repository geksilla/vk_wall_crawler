module VkWallCrawler
  module Wall
    extend Adapter
    extend Utils

    class << self
      attr_accessor :data, :client

      def default
        { limit: 0, count: 100, page: nil }
      end

      def fetch(owner_id, options = {}, &block)
        @options = default.merge options
        @client = VkontakteApi::Client.new
        @data = []
        @block = block
        owner_id = get_id(owner_id) if owner_id.index(/http|vk.com|https/)
        @owner_id = owner_id
        if options[:page].nil?
          @end = false
          looped
        else
          get_page options[:page]
        end
        @data
      end

      def looped
        count = @options[:count]
        total_pages = (@client.wall.get(owner_id: @owner_id.to_i, count: 1).first.to_f/count).ceil
        total_pages.times do |step|
          break if @end
          wall = @client.wall.get(owner_id: @owner_id.to_i, count: count, offset: step*count)
          process wall
        end
      end

      def get_page(page)
        wall = @client.wall.get(owner_id: @owner_id.to_i, count: @options[:count], offset: @options[:count]*(@options[:page] - 1))
        process wall
      end

      def process(wall)
        wall.each_with_index do |post, index|
          next if index == 0
          @end = true if post.date < @options[:limit]
          break if post.date < @options[:limit]
          if @block
            @data << @block.call(post)
          else
            @data << post
          end
        end
      end

    end
  end
end