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
    showScore(){
      this.players.forEach(player => {
        console.log(`${player.alias}: ${player.roundsWon}`)
      });
    }
    showWinner(){
      this.players.sort((a, b)=> b.roundsWon - a.roundsWon)
      console.log(`${this.players[0].alias} is the winner!`)
    }
  }