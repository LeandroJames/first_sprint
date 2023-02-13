export class Scoreboard {
  scores = [];
  constructor() {
    if (typeof Scoreboard.instance === "object ") {
      Object.freeze(this);
      Score.instance = this
    }
  }
  updateScore(player, game, win) {
    const this_game = this.scores.find((e) => e.name === game.name);
    this_game.points.filter((e) => {
      if (e.player === player.alias) {
        win ? e.points++ : e.points--;
        console.log(`${player.alias} now has ${e.points} points`)
      }
    });
  }

  showScores() {
    console.log(`THESE ARE THE SCORES`) 
    this.scores.forEach(game=>{
      console.log(game.name)
      game.points.forEach(total=>
        console.log(`${total.player}: ${total.points} points`))
    })
  }
}

export const my_scoreboard = new Scoreboard

// export class Singleton {
//   constructor() {
//     if (!Singleton.instance) {
//       Singleton.instance = new Score();
//     }
//   }
//   getInstance() {
//     return Singleton.instance;
//   }
// }
