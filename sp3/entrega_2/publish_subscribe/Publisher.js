import * as amqp from "amqplib/callback_api.js";

export class Publisher {
  name;
  constructor(name) {
    this.name = name;
  }
  publish(message) {
    amqp.connect("amqp://localhost", (error0, connection) => {
      if (error0) {
        throw error0;
      }
      connection.createChannel((error1, channel) => {
        if (error1) {
          throw error1;
        }
        const exchange = "logs";
        

        channel.assertExchange(exchange, "fanout", {
          durable: false,
        });
        channel.publish(exchange, "", Buffer.from(message));
        console.log(" [x] Sent %s", message);
      });

      setTimeout(function () {
        connection.close();
        process.exit(0);
      }, 500);
    });
  }
}
