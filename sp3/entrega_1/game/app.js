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
player1.win();
player1.win()
player2.win()
player2.win()
player2.win()
player2.win()
player1.lose()
player1.lose()

//creates different game
let ludo = new Game()
ludo.addPlayer(player1)
ludo.addPlayer(player2)

//plays a few rounds


//check player scores
rockPaperScissors.showScore()
ludo.showscore()

//declare winner
rockPaperScissors.showWinner()