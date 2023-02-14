import { Game } from "./game.js";
import { Player } from "./Player.js";
import {my_scoreboard} from "./Scoreboard.js"

//creates two players
let player1 = new Player("theBeast");
let player2 = new Player("theBeauty");
console.log(player1);
console.log(player2);

//creates new game
let rockPaperScissors = new Game("rockPaperScissors");

//adds players to game
rockPaperScissors.addPlayer(player1);
rockPaperScissors.addPlayer(player2);
console.log(rockPaperScissors.players);

//plays a few games
rockPaperScissors.win(player1);
rockPaperScissors.win(player1)
rockPaperScissors.win(player1)
rockPaperScissors.win(player2)
rockPaperScissors.win(player2)
rockPaperScissors.win(player2)
rockPaperScissors.lose(player1)
rockPaperScissors.lose(player1)

//creates different game
let ludo = new Game("ludo")
ludo.addPlayer(player1)
ludo.addPlayer(player2)

//plays a few rounds
ludo.win(player1)

//check all scores
my_scoreboard.showAllScores()

//check score for specific game
my_scoreboard.showGameScore(ludo)

//try to create a new Scoreboard, which fails as there is no export of the class
//const new_score = new Scoreboard
//new_score.showScores()

//declare winner specific game
my_scoreboard.showGameWinner(ludo)

//declare winners
my_scoreboard.showAllWinners()