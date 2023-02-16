export class Product {
    brand
    price
    
    constructor (brand, price, currency) {
        this.brand=brand
        this.price= {total: price, currency: currency}
    }
}