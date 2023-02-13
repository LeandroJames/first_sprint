export class Score {
  scores = [];
  constructor() {
    if (typeof Score.instance === "object ") {
      return Score.instance;
    }
  }
  showScores() {
    return this.scores;
  }
}

export class Singleton {
  constructor() {
    if (!Singleton.instance) {
      Singleton.instance = new Score();
    }
  }
  getInstance() {
    return Singleton.instance;
  }
}
