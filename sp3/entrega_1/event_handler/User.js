import { eventEmitter } from "./app.js";

export class User {
    username;
    constructor(username) {
      this.username = username;
    }
    sendMessage(topic, message) {
      eventEmitter.emit("new_message", this, topic, message);
    }
    receiveMessage(user, message) {
      if (user === this) return;
      console.log(
        `${this.username} received this message from ${user.username}: ${message}`
      );
    }
  }