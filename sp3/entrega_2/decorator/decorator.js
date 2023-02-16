import * as exchange_rates from "./currency_conversions.json" assert {type: "json"}

// console.log(exchange_rates.default.CAD_EUR)

//Decorator
const convertCurrency = (currency, price) => {
    const key = `${currency}_EUR`
    return price * exchange_rates.default[key]
}

//Products
const  phone = {
    "brand": "Nokia",
    "price": 35,
    "currency": "USD"
}
const  jumper = {
    "brand": "Adihash",
    "price": 7.50,
    "currency": "GBP"
}
const  water = {
    "brand": "Evian",
    "price": 20,
    "currency": "CHF"
}

//App
const phoneInEuro = convertCurrency(phone.currency, phone.price)
const jumperInEuro = convertCurrency(jumper.currency, jumper.price)
const waterInEuro = convertCurrency(water.currency, water.price)

console.log(`The phone costs ${phoneInEuro} euro`)
console.log(`The jumper costs ${jumperInEuro} euro`)
console.log(`The water bottle costs ${waterInEuro} euro`)