namespace :rabbitmq do
  desc "Connect consumer to producer"
  task :setup do
    require "bunny"

    conn = Bunny.new.tap(&:start)
    ch = conn.create_channel
    queue_restaurants = ch.queue(
      "dashboard.restaurants",
      durable: true
    )
    
    # bind queue to exchange
    queue_restaurants.bind("crawler.restaurants")
    
    conn.close
  end
end