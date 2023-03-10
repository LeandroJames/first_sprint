export class Scoreboard {
  scores = [];
  constructor() {
    if (typeof Scoreboard.instance === "object ") {
      Score.instance = this;
    }
  }
  updateScore(player, game, win) {
    const this_game = this.scores.find((e) => e.name === game.name);
    this_game.players.filter((e) => {
      if (e.alias === player.alias) {
        win ? e.points++ : e.points--;
        console.log(`${player.alias} now has ${e.points} points`);
      }
    });
  }

  showGameScore(game) {
    console.log(`These are the scores for ${game.name}:`);
    const this_game = this.scores.find((scores) => scores.name === game.name);
    this_game.players.forEach((player) =>
      console.log(`${player.alias}: ${player.points} points`)
    );
  }

  showGameWinner(game) {
    game.players.sort((a, b) => b.points - a.points);
    console.log(`${game.players[0].alias} wins at ${game.name}!`);
  }
}

// showAllScores() {
//   console.log(`THESE ARE THE SCORES`);
//   this.scores.forEach((game) => {
//     console.log(game.name);
//     game.players.forEach((player) =>
//       console.log(`${player.alias}: ${player.points} points`)
//     );
//   });
// }

// showAllWinners() {
//   this.scores.forEach((game) => {
//     game.players.sort((a, b) => b.points - a.points);
//     console.log(`${game.players[0].alias} wins at ${game.name}!`);
//   });
// }
