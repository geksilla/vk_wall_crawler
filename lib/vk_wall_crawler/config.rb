module VkWallCrawler
  module Configuration

    OPTIONS = [:access_token]
    attr_accessor *OPTIONS

    def configure
      yield self if block_given?
      self
    end

  end
end