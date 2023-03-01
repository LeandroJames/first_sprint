import * as input from "./number_input.json" assert { type: "json" };
import { Middleware } from "./Middleware.js";
import { Calculator } from "./Calculator.js";

const calc = new Calculator();
const app = new Middleware(calc);

app.use((req, next) => {
  let result1 = req.num1 ** 2;
  let result2 = req.num2 ** 2;
  console.log(
    `${req.num1} squared is ${result1}, and ${req.num2} squared is ${result2}`
  );
  next();
});

app.use((req, next) => {
  let result1 = req.num1 ** 3;
  let result2 = req.num2 ** 3;
  console.log(
    `${req.num1} cubed is ${result1}, and ${req.num2} cubed is ${result2}`
  );
  next();
});

app.use((req, next) => {
  let result1 = req.num1 / 2;
  let result2 = req.num2 / 2;
  console.log(
    `${req.num1} halved is ${result1}, and ${req.num2} halved is ${
      result2
    }`
  );
  next();
});

let num1 = input.default[0].no1;
let num2 = input.default[0].no2;

console.log(app.add({ num1, num2 }));
console.log(app.multiply({ num1, num2 }));
console.log(app.substract({ num1, num2 }));
