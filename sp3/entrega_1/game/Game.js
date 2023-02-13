import { my_scoreboard, Scoreboard } from "./Scoreboard.js";
export class Game {
  name;
  players = [];
  //score;
  constructor(name) {
    //this.score = new Scoreboard();
    this.name = name;
    my_scoreboard.scores.push({ name: name, points: [] });
  }
  addPlayer(player) {
    this.players.push(player);
    const game = my_scoreboard.scores.filter((e) => e.name === this.name);
    game[0].points.push({ player: player.alias, points: 0 });
    console.log(`${player.alias} added to ${this.name}`);
  }
  // showWinner() {
  //   this.players.sort((a, b) => b.roundsWon - a.roundsWon);
  //   console.log(`${this.players[0].alias} is the winner!`);
  // }
  win(winner) {
    my_scoreboard.updateScore(winner, this, true);
    console.log(`${this.name}: ${winner.alias} wins!`);
  }
  lose(loser) {
    my_scoreboard.updateScore(loser, this, false);
    console.log(`${this.name}: ${loser.alias} loses!`);
  }
}
