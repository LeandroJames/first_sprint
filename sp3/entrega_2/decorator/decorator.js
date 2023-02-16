import * as exchange_rates from "./currency_conversions.json" assert {type: "json"}
import { Product } from "./Product.js"


//Decorator
const addPriceEuro = (product) => {
    const key = `${product.price.currency}_EUR`
    product.priceInEuro= product.price.total * exchange_rates.default[key]
}

//Products
let  phone = new Product("Nokia", 35, "USD")
let  jumper = new Product ("Adihash", 7.50, "GBP")
let  water = new Product("Evian", 20, "CHF")

//App
addPriceEuro(phone)
addPriceEuro(jumper)
addPriceEuro(water)

console.log(phone)
console.log(jumper)
console.log(water)