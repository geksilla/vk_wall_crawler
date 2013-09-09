require "vk_wall_crawler"

describe String do
  it "should extract user id from link" do
    "http://vk.com/actis".to_id.should eql("18862320")
  end
end