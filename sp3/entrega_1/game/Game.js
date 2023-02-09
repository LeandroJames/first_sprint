import { Score } from "./Score.js";
export class Game {
    players = [];
    score;
    constructor() {
      this.score = new Score();
    }
    addPlayer(player) {
      this.players.push(player);
    }
  }