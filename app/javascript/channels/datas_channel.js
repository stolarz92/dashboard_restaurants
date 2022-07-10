import consumer from "./consumer"

consumer.subscriptions.create({ channel: "DatasChannel" }, {
    connected: function() {
      console.log("Connected to the room!");
    },
    received: function(data) {
      console.log("Recieving:")
      console.log(data.content)

      return $('#restaurants').append(this.renderRestaurant(data));
    },
  
    renderRestaurant: function(data) {
      return `<ul>
                <li>${data.name}</li>
              </ul>`;
    }
  }
);