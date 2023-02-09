import { Topic } from "./Topic.js";
import { User } from "./User.js";
import EventEmitter from "events";
export const eventEmitter = new EventEmitter();

const messageAll = (subscribers, user, message) => {
  subscribers.forEach((subscriber) => subscriber.receiveMessage(user, message));
};

const relayMessage = (user, topic, message) => {
  //console.log(user, topic, message);
  topic.messageReceived(user);
  const subscribers = topic.getSubscribers()
  messageAll(subscribers, user, message)
};

//Create some fun topics
const topic1 = new Topic("Taking drugs before breakfast on a weekday");
const topic2 = new Topic("Should people who add pineapple to pizza be shot?")

//Create some random users
const user1 = new User("charlie_sheen");
const user2 = new User("johnny_depp");
const user3 = new User("oso_panda");
const user4 = new User("italian_italian")
const user5 = new User("very_italian_italian")

//Subscribe according to possible interests
topic2.subscribe(user4)
topic2.subscribe(user5)
topic1.subscribe(user1);
topic1.subscribe(user2);
topic1.subscribe(user3);

eventEmitter.on("new_message", relayMessage);

//Send some random messages
user1.sendMessage(topic1, "Only on uneven Tuesdays");
user4.sendMessage(topic2, "Yes")
user5.sendMessage(topic2, "Multiple times")