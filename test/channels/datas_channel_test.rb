class DatasChannelTest < ActionCable::Channel::TestCase
  test "subscribes and stream for a datas" do
    # Simulates the subscription to the channel
    subscribe
 
    # The channel object is available as `subscription` identifier.

    # We can check that subscription was successfully created. 
    assert subscription.confirmed?

    # We can check that channel subscribed the connection to correct stream
    assert_has_stream "datas_channel"
  end

  test '.push broadcasts to the channel' do
    data = "{\"name\":\"Res 1\"}"

    assert_broadcast_on('datas_channel',{ name: "Res 1" }) do
      Restaurant.push(data)
    end
  end
end