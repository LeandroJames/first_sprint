import { User } from "./User.js"

export class Topic {
    name;
    subscribers = [];
    constructor(name) {
      this.name = name;
    }
    subscribe(User) {
      this.subscribers.push(User);
    }
    messageReceived(user) {
      console.log(`Topic: ${this.name} //// ${user.username} has sent a new message`);
    }
    getSubscribers() {
      return this.subscribers;
    }
  }