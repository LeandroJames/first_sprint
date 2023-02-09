import { Game } from "./game.js";
import { Player } from "./Player.js";

//creates two players
let player1 = new Player("theBeast");
let player2 = new Player("theBeauty");
console.log(player1);
console.log(player2);

//creates new game
let rockPaperScissors = new Game();

//adds players to game
rockPaperScissors.addPlayer(player1);
rockPaperScissors.addPlayer(player2);
console.log(rockPaperScissors.players);

//plays a few games
rockPaperScissors.score.win(player1);
rockPaperScissors.score.win(player1);
rockPaperScissors.score.win(player2);
rockPaperScissors.score.win(player1);
rockPaperScissors.score.lose(player1);
rockPaperScissors.score.win(player2);
rockPaperScissors.score.win(player2);

//check player scores
rockPaperScissors.showScore()

//declare winner
rockPaperScissors.showWinner()