const { MongoClient, ObjectId } = require("mongodb");
const uri = "mongodb://localhost:27017";
const client = new MongoClient(uri);

const suppliers = [
  {
    _id: new ObjectId(100000000000000000000001),
    name: "Gafas molongas",
    address: "C/ València 189, 6A, 08020 Barcelona",
    phone_no: "559684268",
    fax: "559684268",
    NIF: "PO89549516",
    glasses_supplied: [new ObjectId(200000000000000000000001), new ObjectId(200000000000000000000003), new ObjectId(200000000000000000000004), new ObjectId(200000000000000000000005)]
  },
  {
     _id: new ObjectId(100000000000000000000002),
      name: "Lunettes Lunaires",
      address: "C/ de França 15, 16020 Figueres",
      phone_no: "984775214",
      fax: "984775214",
      NIF: "8989962224",
      glasses_supplied: [new ObjectId(200000000000000000000002), new ObjectId(200000000000000000000006)]
    },
  ]

const customers = [
  {
    name: "Juan Pérez",
    address: "C/ Mallorca 221, 3B",
    postcode: "08015",
    city: "Barcelona",
    phone_no: "689487556",
    email: "juanperez@email.com",
    signup_date: new Date("2022-10-2"),
    purchases: [
      {
        date: new Date("2023-01-24"),
        glasses: {
          _id: new ObjectId(200000000000000000000001),
          brand: "RayBan",
          frame_type: "Wire",
          graduation_LR: [2, 1],
          frame_colour: "silver",
          lense_colour: "none",
          price: 160,
        },
        sold_by: "Aethelbert",
      },
      {
        date: new Date("2022-12-22"),
        glasses:{
          _id: new ObjectId(200000000000000000000003),
          brand: "RayBan",
          frame_type: "Rimless",
          graduation_LR: [2, 1],
          frame_colour: "black",
          lense_colour: "none",
          price: 150,
        },
        sold_by: "Aethelbert"
      }
    ],
  },
  {
    name: "Alba Álvarez",
    address: "C/ València 228, 4B",
    postcode: "08020",
    city: "Barcelona",
    phone_no: "698874126",
    email: "albalvarez@email.com",
    signup_date: new Date("2022-08-20"),
    purchases: [
        {date: new Date ("2022-12-27"),
        glasses: {
          _id: new ObjectId(200000000000000000000002),
          brand: "Police",
          frame_type: "Rimless",
          graduation_LR: [1, 1],
          frame_colour: "gold",
          lense_colour: "none",
          price: 140
        },
        sold_by: "Aethelbert"
  }]
  },
  {
    name: "Paula Fernández",
    address: "C/ Còrsega 10, 4A",
    postcode: "08014",
    city: "Barcelona",
    phone_no: "674411283",
    email: "paulafernandez@email.com",
    signup_date: new Date("2022-10-12"),
    purchases: [
      {date: new Date("2023-01-22"),
      glasses: {
        _id: new ObjectId(200000000000000000000005),
        brand: "Sting",
        frame_type: "Rimless",
        graduation_LR: [7, 6],
        frame_colour: "blue",
        lense_colour: "none",
        price: 90,
      },
      sold_by: "Aethelbert"
    }
    ],
  },
  {
    name: "Eusebio de la Gran",
    address: "C/ Diputació 140, Principal",
    postcode: "08010",
    city: "Barcelona",
    phone_no: "931566648",
    signup_date: new Date("2023-01-09"),
    purchases: [(
      {date: new Date ("2023-01-22"),
      glasses: {
        _id: new ObjectId(200000000000000000000004),
        brand: "Sting",
        frame_type: "thick",
        graduation_LR: [3, 3],
        frame_colour: "black",
        lense_colour: "none",
        price: 120,
      },
      sold_by: "Cuthbert"
    }
  ),]
  },
  {
    name: "Jordi Coromines",
    address: "C/ Girona 10, 6C",
    postcode: "08021",
    city: "Barcelona",
    phone_no: "689547887",
    email: "coromines_jordi@email.com",
    signup_date: new Date("2022-07-05"),
    referred_by: 3,
    purchases: [(
        {date: new Date("2023-01-29"),
        glasses: {
          _id: new ObjectId(200000000000000000000006),
          brand: "Police",
          frame_type: "wire",
          graduation_LR: [6, 5],
          frame_colour: "black",
          lense_colour: "none",
          price: 140,
        },
        sold_by: "Cuthbert"
      }
    ),
    ],
  }
];

const addCustomers = async (client, customers) => {
  await client.db("otpicians").collection("customers").insertMany(customers);
  console.log("Customers successfully added to database")
};

const addSuppliers = async (client, suppliers) => {
  await client.db("opticians").collection("suppliers").insertMany(suppliers);
  console.log("Suppliers successfully added to database")
};

const main = async () => {
  try {
    await client.connect();
    await client.db("admin").command({ ping: 1 });
    console.log("Connected successfully to server");
    const databases= await client.db().admin().listDatabases()
    let opticians_exists = databases.databases.filter((element)=>element.name === "opticians")
    if (opticians_exists) {
       await client.db("opticians").dropDatabase();
    }
    await addCustomers(client, customers);
    await addSuppliers(client, suppliers);
  } finally {
    await client.close();
  }
};
main().catch(console.dir);
