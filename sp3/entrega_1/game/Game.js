import { Score, Singleton } from "./Score.js";
export class Game {
    name
    players = [];
    score;
    constructor(name) {
      this.score = new Singleton().getInstance();
      this.name = name;
      this.score.scores.push({"game_name": name, points: [] })
    }
    addPlayer(player) {
      this.players.push(player);
      const game = this.score.scores.filter(e=>e.name===this.name)
      console.log(game)
      game[0].points.push({player: player, points: 0})
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
    win(winner) {
      winner.points += 1;
    }
    lose(loser) {
      loser.points -= 1;
    }
  }