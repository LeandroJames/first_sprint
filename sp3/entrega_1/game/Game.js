import { Scoreboard } from "./Scoreboard.js";
export class Game {
  name;
  players = [];
  score;
  constructor(name) {
    this.score = new Scoreboard()
    this.name = name;
    this.score.scores.push({ name: name, players: [] });
  }
  addPlayer(player) {
    this.players.push(player);
    const game = this.score.scores.filter((e) => e.name === this.name);
    game[0].players.push({ alias: player.alias, points: 0 });
    console.log(`${player.alias} added to ${this.name}`);
  }
  // showWinner() {
  //   this.players.sort((a, b) => b.roundsWon - a.roundsWon);
  //   console.log(`${this.players[0].alias} is the winner!`);
  // }


  win(winner) {
    this.score.updateScore(winner, this, true);
    console.log(`${this.name}: ${winner.alias} wins!`);
  }
  lose(loser) {
    this.score.updateScore(loser, this, false);
    console.log(`${this.name}: ${loser.alias} loses!`);
  }
}