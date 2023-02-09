export class Score {
    constructor() {
      if (typeof Score.instance === "object ") {
        return Score.instance;
      }
    }
    win(winner) {
      winner.roundsWon += 1;
    }
    lose(loser) {
      loser.roundsWon -= 1;
    }
  }