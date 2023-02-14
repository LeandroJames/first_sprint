import * as amqp from "amqplib/callback_api.js";

amqp.connect("amqp://localhost", function (error0, connection) {
  if (error0) throw error0;
  connection.createChannel((error1, channel) => {
    if (error1) throw error1;
    const queue = "hello";
    const message = "Hello world";
    channel.assertQueue(queue, { durable: false });
    channel.sendToQueue(queue, Buffer.from(message));
    console.log("[x] Sent %s", message);
  });
  setTimeout(() => {
    connection.close();
    process.exit(0);
  }, 500);
});
