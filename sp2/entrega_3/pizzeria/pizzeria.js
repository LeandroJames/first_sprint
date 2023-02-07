// const { MongoClient, ObjectId } = require("mongodb");
// const uri =
//   "mongodb://localhost:27017";
// const client = new MongoClient(uri);

const branches = [
  {
    address: "Salvà 54",
    postcode: 08004,
    city: "Barcelona",
    province: "Barcelona",
    employees: [
      {
        _id: new ObjectId("200000000000000000000001"),
        name: "Sara Gonçalves",
        id_no: 38954325,
        phone: 678984444,
        position: "Cook",
      },
      {
        _id: new ObjectId("200000000000000000000002"),
        name: "Pablo Garciadiego",
        id_no: 12345678,
        phone: 654987321,
        position: "Delivery",
      },
    ],
    orders: [
      {
        time_date: new Date("2022-12-2421:30:00"),
        type: "Delivery",
        order_items: [
          {
            product: new ObjectId("100000000000000000000003"),
            quantity: 2,
          },
          {
            product: new ObjectId("100000000000000000000008"),
            quantity: 2,
          },
        ],
        customer: {
          name: "Juan Pérez Pérez",
          address: "Radas 37, 1-2",
          postcode: 08004,
          city: "Barcelona",
          province: "Barcelona",
          phone_no: 689898970,
        },
        delivered_by: new ObjectId("200000000000000000000002"),
        Total: 26,
      },
    ],
  },
  {
    address: "Diputació 14",
    postcode: 08015,
    city: "Barcelona",
    province: "Barcelona",
    employees: [
      {
        _id: new ObjectId("200000000000000000000003"),
        name: "Albert Font",
        id_no: 15667744,
        phone: 698745321,
        position: "Cook",
      },
      {
        _id: new ObjectId("200000000000000000000004"),
        name: "Maria Pla",
        id_no: 78945632,
        phone: 674125466,
        position: "Delivery",
      },
    ],
    orders: [
      {
        time_date: new Date("2022-12-3121:00:00"),
        type: "Collect",
        order_items: [
          {
            product: new ObjectId("100000000000000000000006"),
            quantity: 2,
          },
        ],
        customer: {
          name: "Arturo Reverte Pérez",
          address: "Espanya 1, 2",
          postcode: 08007,
          city: "Barcelona",
          province: "Barcelona",
          phone_no: 666000333,
        },
        Total: 19,
      },
      {
        time_date: new Date("2023-01-3121:58:00"),
        type: "Delivery",
        order_items: [
          {
            product: new ObjectId("100000000000000000000005"),
            quantity: 2,
          },
          {
            product: new ObjectId("100000000000000000000007"),
            quantity: 1,
          },
          {
            product: new ObjectId("100000000000000000000008"),
            quantity: 3,
          },
        ],
        customer: {
          name: "Antonella Bianchi",
          address: "Plaça del Sortidor 12, 2-2",
          postcode: 08004,
          city: "Barcelona",
          province: "Barcelona",
          phone_no: 678981122,
        },
        delivered_by: new ObjectId("200000000000000000000004"),
        Total: 29,
      },
    ],
  },
  {
    address: "Plaça Sant Antoni",
    postcode: 17300,
    city: "Blanes",
    province: "Girona",
    employees: [
      {
        _id: new ObjectId("200000000000000000000005"),
        name: "Albert Font",
        id_no: 35566774,
        phone: 698745321,
        position: "Cook",
      },
      {
        _id: new ObjectId("200000000000000000000006"),
        name: "Maria Garcia",
        id_no: 12344321,
        phone: 688997744,
        position: "Delivery",
      },
    ],
    orders: [
      {
        time_date: new Date("2023-02-0221:47:00"),
        type: "Delivery",
        order_items: [
          {
            product: new ObjectId("100000000000000000000001"),
            quantity: 3,
          },
          {
            product: new ObjectId("100000000000000000000002"),
            quantity: 1,
          },
          {
            product: new ObjectId("100000000000000000000004"),
            quantity: 1,
          },
        ],
        customer: {
          name: "Tomasa Tomásez Tomaczik",
          address: "Santo Tomás 5, 3",
          postcode: 08004,
          city: "Blanes",
          province: "Girona",
          phone_no: 623475688,
        },
        delivered_by: new ObjectId("200000000000000000000006"),
        Total: 46,
      },
    ],
  },
];

const products = [
  {
    _id: new ObjectId("100000000000000000000001"),
    name: "Margarita",
    description: "Tomato & mozzarella",
    image: "IMG",
    type: "Pizza",
    category: "Basic",
    price: 8,
  },
  {
    _id: new ObjectId("100000000000000000000002"),
    name: "Diavola",
    description: "Tomato, mozzarella & spicy pepperoni",
    image: "IMG",
    type: "Pizza",
    category: "Traditional",
    price: 10,
  },
  {
    _id: new ObjectId("100000000000000000000003"),
    name: "Romana",
    description: "Tomato, mozzarella, olives & ham",
    image: "IMG",
    type: "Pizza",
    category: "Traditional",
    price: 11,
  },
  {
    _id: new ObjectId("100000000000000000000004"),
    name: "Napoletana",
    description: "Tomato, anchovies, olives & capers",
    image: "IMG",
    type: "Pizza",
    category: "Traditional",
    price: 11,
  },
  {
    _id: new ObjectId("100000000000000000000005"),
    name: "Classic burger",
    description: "Beefburger, cheese, onion, gherkins & ketchup",
    image: "IMG",
    type: "Burger",
    price: 7,
  },
  {
    _id: new ObjectId("100000000000000000000006"),
    name: "Nasty burger",
    description: "Classic burger + bacon & fried egg",
    image: "IMG",
    type: "Burger",
    price: 9.5,
  },
  {
    _id: new ObjectId("100000000000000000000007"),
    name: "Veggie burger",
    description: "Beanburger, cream cheese, gherkins & beetroot",
    image: "IMG",
    type: "Burger",
    price: 9,
  },
  {
    _id: new ObjectId("100000000000000000000008"),
    name: "Coke",
    description: "33cl can",
    image: "IMG",
    type: "Drink",
    price: 2,
  },
  {
    _id: new ObjectId("100000000000000000000009"),
    name: "Water",
    description: "50cl bottle",
    image: "IMG",
    type: "Drink",
    price: 1.5,
  },
];

db.branches.insertMany(branches);
db.products.insertMany(products);

// const addBranches = async (client, branches) => {
//   await client.db("pizzeria").collection("branches").insertMany(branches);
//   console.log("Branches successfully added to database");
// };

// const addProducts = async (client, products) => {
//   await client.db("pizzeria").collection("products").insertMany(products);
//   console.log("Products successfully added to database");
// };

// const main = async () => {
//   try {
//     await client.connect();
//     await client.db("admin").command({ ping: 1 });
//     console.log("Connected successfully to server");
//     const databases = await client.db().admin().listDatabases();
//     let pizzeria_exists = databases.databases.filter(
//       (element) => element.name === "pizzeria"
//     );
//     if (pizzeria_exists) {
//       await client.db("pizzeria").dropDatabase();
//     }
//     await addBranches(client, branches);
//     await addProducts(client, products);
//   } finally {
//     await client.close();
//   }
// };
// main().catch(console.dir);
