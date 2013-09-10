# VkWallCrawler

Warning this gem in development!

I propose to create gemset:

    rvm gemset create <gemset_name>
    
or create .ruby-gemset file with gemset name

**Build**

    bundle exec gem build vk_wall_crawler.gemspec

**Install**

    bundle
or

    bundle exec gem install vk_wall_crawler-0.0.1.gem
    
## Methods List

<table>
<tr>
<th>
</th>
<th>
Function
</th>
<th>Params</th>
<th>Result</th>
</tr>
<tr>
<td>
1.
</td>
<td>
VkWallCrawler::Wall.fetch($1,$2) do |$3, $4|<br>
.....<br>
end
</td>
<td>
1. $1 - user id or link to profile <br>
2. $2(optional) - date limit <br>
3. $3 - hash which pushed to data array<br>
4. $4 - single post response from vk api
</td>
<td>
Return hash array of posts
</td>
</tr>
</table>


##Examples

**VkWallCrawler::Wall.fetch**
```ruby
    data = VkWallCrawler::Wall.fetch('http://vk.com/actis') do |myhash, response|
        myhash[:id] = response.id
        myhash[:text] = response.text
        myhash[:original_link] = "http://vk.com/wall#{response.from_id}_#{response.id}"
    end
```

##To-Do

- Faraday configuration
- default hash format
- break limit range
- **search by words functional**
- TESTS!

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
