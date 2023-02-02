const { MongoClient, ObjectId } = require("mongodb");
// Connection URI
const uri = "mongodb://localhost:27017/?maxPoolSize=20&w=majority";
// Create a new MongoClient
const client = new MongoClient(uri);

const listDatabases = async (client) => {
  const databaseList = await client.db().admin().listDatabases();
  console.log("Current databases:");
  databaseList.databases.forEach((database) => console.log(database));
};

const suppliers = [
  {
    _id: ObjectId("s00000000000000000000001"),
    name: "Gafas molongas",
    address: "C/ València 189, 6A, 08020 Barcelona",
    phone_no: "559684268",
    fax: "559684268",
    NIF: "PO89549516",
    glasses_supplied: [ObjectId("g00000000000000000000001"), ObjectId("g00000000000000000000003")]
  },
  {
     _id: ObjectId("s00000000000000000000002"),
      name: "Lunettes Lunaires",
      address: "C/ de França 15, 16020 Figueres",
      phone_no: "984775214",
      fax: "984775214",
      NIF: "8989962224",
      glasses_supplied: [ObjectId("g00000000000000000000002")]
    },
  ]
  {
    _id: ObjectId("g00000000000000000000003"),
    brand: "RayBan",
    frame_type: "Rimless",
    graduation_LR: [2, 1],
    frame_colour: "black",
    lense_colour: "none",
    price: 150,
    supplier: {
      _id: 1,
      name: "Gafas molongas",
      address: "C/ València 189, 6A, 08020 Barcelona",
      phone_no: "559684268",
      fax: "559684268",
      NIF: "PO89549516",
    },
  },
  {
   ,
    supplier: {
      _id: 1,
      name: "Gafas molongas",
      address: "C/ València 189, 6A, 08020 Barcelona",
      phone_no: "559684268",
      fax: "559684268",
      NIF: "PO89549516",
    },
  },
  {
    _id: ObjectId("g00000000000000000000005"),
    brand: "Sting",
    frame_type: "Rimless",
    graduation_LR: [7, 6],
    frame_colour: "blue",
    lense_colour: "none",
    price: 90,
    supplier: {
      _id: 1,
      name: "Gafas molongas",
      address: "C/ València 189, 6A, 08020 Barcelona",
      phone_no: "559684268",
      fax: "559684268",
      NIF: "PO89549516",
    },
  },
];

const customers = [
  {
    name: "Juan Pérez",
    address: "C/ Mallorca 221, 3B",
    postcode: "08015",
    city: "Barcelona",
    phone_no: "689487556",
    email: "juanperez@email.com",
    signup_date: "2022-10-2",
    purchases: [
      {
        date: "2023-01-24",
        glasses: {
          _id: ObjectId("g00000000000000000000001"),
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
        date: "2022-12-22",
        glasses:{
          _id: ObjectId("g00000000000000000000003"),
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
    signup_date: "2022-08-20",
    purchases: [
        {date: "2022-12-27",
        glasses: {
          _id: ObjectId("g00000000000000000000002"),
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
    _id: 3,
    name: "Paula Fernández",
    address: "C/ Còrsega 10, 4A",
    postcode: "08014",
    city: "Barcelona",
    phone_no: "674411283",
    email: "paulafernandez@email.com",
    signup_date: "2022-10-12",
    purchases: [
      {date: "2023-01",
      glasses: {
        _id: ObjectId("g00000000000000000000005"),
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
    _id: 4,
    name: "Eusebio de la Gran",
    address: "C/ Diputació 140, Principal",
    postcode: "08010",
    city: "Barcelona",
    phone_no: "931566648",
    signup_date: "2023-01-09",
    purchases: [],
  },
  {
    _id: 5,
    name: "Jordi Coromines",
    address: "C/ Girona 10, 6C",
    postcode: "08021",
    city: "Barcelona",
    phone_no: "689547887",
    email: "coromines_jordi@email.com",
    signup_date: "2022-07-05",
    referred_by: 3,
    purchases: [],
  },
];

const addGlasses = async (client, glasses) => {
  await client.db("optica").dropDatabase();
  await client.db("optica").collection("glasses").insertMany(glasses);
};

const main = async () => {
  try {
    // Connect the client to the server (optional starting in v4.7)
    await client.connect();
    // // Establish and verify connection
    await client.db("admin").command({ ping: 1 });
    console.log("Connected successfully to server");
    await client.db("optica").dropDatabase();
    await addGlasses(client, glasses);
  } finally {
    // Ensures that the client will close when you finish/error
    await client.close();
  }
};
main().catch(console.dir);
