import consumer from "./consumer"

consumer.subscriptions.create("RoomChannel", {
  connected() {
    console.log('we are living')
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    $('#msg').append('<div class="msg">'+ data.content + '</div>')
    console.log(data)
    // Called when there's incoming data on the websocket for this channel
  }
});
