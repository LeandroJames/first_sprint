import * as input from "./number_input.json" assert {type: "json"}
import { Middleware } from "./Middleware.js"
import { Calculator } from "./Calculator.js"


const calc = new Calculator
const middleware = new Middleware(calc)


console.log(input)

const first_input= input.default[0]
console.log(first_input.no1)
let first_result=middleware.square(first_input.no1)
console.log(`First number squared is: ${first_result}`) 
let second_result=middleware.square(first_input.no2)
console.log(`Second number squared is: ${second_result}`) 
let  total_result = middleware.add(first_result, second_result)
console.log(`The sum of both numbers is: ${total_result}`)

//input[0].no1