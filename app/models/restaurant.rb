class Restaurant
  KEY = "restaurant"
  STORE_LIMIT = 10
  
  def self.list(limit = STORE_LIMIT)
    $redis.lrange(KEY, 0, limit).map do |raw_restaurant|
      JSON.parse(raw_restaurant)
    end
  end

  def self.push(raw_restaurant)
    datas = JSON.parse(raw_restaurant)
    broadcast_to_datas(datas)
    $redis.lpush(KEY, raw_restaurant)
    $redis.ltrim(KEY, 0, STORE_LIMIT-1)
  end

  private

  def self.broadcast_to_datas(datas)
    ActionCable.server.broadcast(
      'datas_channel',
      { name: datas['name'] }
    )
  end
end