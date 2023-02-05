const { MongoClient, ObjectId } = require("mongodb");
const uri = "mongodb://localhost:27017";
const client = new MongoClient(uri);

const artists = [
  {
    _id: new ObjectId(100000000000000000000001),
    name: "Charanga",
    picture: "IMG",
    related_artists: new ObjectId(100000000000000000000003),
    albums: [
      {
        _id: new ObjectId(200000000000000000000001),
        name: "Éxitos charangueros",
        year: 2011,
        cover: "cover_image",
        songs: [
          {
            _id: new ObjectId(300000000000000000000001),
            name: "Paquito el chocolatero",
            length: 170,
            times_played: 25,
          },
          {
            _id: new ObjectId(300000000000000000000002),
            name: "Pincho de tortilla",
            length: 154,
            times_played: 36,
          },
          {
            _id: new ObjectId(300000000000000000000002),
            name: "Bragas amarillas",
            length: 123,
            times_played: 31,
          },
        ],
      },
      {
        _id: new ObjectId(200000000000000000000004),
        name: "Más éxitos charangueros",
        year: 2018,
        cover: "cover_image",
        songs: [
          {
            _id: new ObjectId(300000000000000000000009),
            name: "A la pared mi senyor",
            length: 134,
            times_played: 94,
          },
          {
            _id: new ObjectId(300000000000000000000010),
            name: "Me han dicho que te diga",
            length: 154,
            times_played: 123,
          },
        ],
      },
    ],
  },
  {
    _id: new ObjectId(100000000000000000000002),
    name: "Bananarama",
    picture: "IMG",
    albums: [
      {
        _id: new ObjectId(200000000000000000000002),
        name: "Fruity",
        year: 1978,
        cover: "cover_image",
        songs: [
          {
            _id: new ObjectId(300000000000000000000004),
            name: "Blueberries",
            length: 189,
            times_played: 68,
          },
          {
            _id: new ObjectId(300000000000000000000005),
            name: "Plums",
            length: 1210,
            times_played: 24,
          },
          {
            _id: new ObjectId(300000000000000000000006),
            name: "Peaches",
            length: 300,
            times_played: 12,
          },
        ],
      },
    ],
  },
  {
    _id: new ObjectId(100000000000000000000003),
    name: "Covers covers",
    picture: "IMG",
    related_artists: new ObjectId(100000000000000000000001),
    albums: [
      {
        _id: new ObjectId(200000000000000000000003),
        name: "Éxitos de ayer y hoy",
        year: 2018,
        cover: "cover_image",
        songs: [
          {
            _id: new ObjectId(300000000000000000000008),
            name: "Highway to hell de los ACDC",
            length: 180,
            times_played: 63,
          },
          {
            _id: new ObjectId(300000000000000000000007),
            name: "Final countdown de los Europe",
            length: 230,
            times_played: 98,
          },
        ],
      },
    ],
  },
];

const users = [
  {
    _id: new ObjectId(400000000000000000000001),
    username: "juani",
    email: "juaniperez@email.com",
    password: "1234",
    date_of_birth: new Date("1980-07-03"),
    gender: "F",
    country: "Spain",
    postcode: "22191",
    premium_subscriber: false,
    playlists: [
      {
        name: "pachangueo del güeno",
        created_on: "2023-01-16",
        contents: [
          {
            song: new ObjectId(300000000000000000000002),
            added_by: new ObjectId(400000000000000000000001),
            added_on: new Date("2023-01-16"),
          },
          {
            song: new ObjectId(300000000000000000000007),
            added_by: new ObjectId(400000000000000000000001),
            added_on: new Date("2023-01-16"),
          },
          {
            song: new ObjectId(300000000000000000000003),
            added_by: new ObjectId(400000000000000000000001),
            added_on: new Date("2023-01-16"),
          },
          {
            song: new ObjectId(300000000000000000000009),
            added_by: new ObjectId(400000000000000000000001),
            added_on: new Date("2023-01-22"),
          },
        ],
        active: true,
      },
    ],
  },
  {
    _id: new ObjectId(400000000000000000000002),
    username: "pepe",
    email: "pepevazquez@email.com",
    password: "22345",
    date_of_birth: new Date("1985-01-02"),
    gender: "M",
    country: "Spain",
    postcode: "15009",
    premium_subscriber: true,
    subscription_details: {
      start_date: new Date("2023-01-15"),
      end_date: new Date("2023-02-15"),
      payment_method: "Card",
      card_details: {
        card_no: 123456789,
        expiry_date: new Date("2025-01-01"),
        CVV: 998,
      },
      past_payments: [
        {
          payment_method: "Card",
          date: new Date("2022-12-15"),
          amount: 9.95,
        },
        {
          payment_method: "Card",
          date: new Date("2023-01-15"),
          amount: 9.95,
        },
      ],
    },
    following: [
      {
        artist: new ObjectId(100000000000000000000002),
      },
    ],
  },
  {
    _id: new ObjectId(400000000000000000000003),
    username: "eritreo",
    email: "pacogarcia@email.com",
    password: "5555",
    date_of_birth: new Date("1995-05-20"),
    gender: "M",
    country: "Spain",
    postcode: "18008",
    premium_subscriber: true,
    subscription_details: {
      start_date: new Date("2023-01-20"),
      end_date: new Date("2023-02-20"),
      payment_method: "PayPal",
      past_payments: [
        {
          payment_method: "PayPal",
          paypal_id: "12345678",
          date: new Date("2022-01-20"),
          amount: 9.95,
        },
      ],
    },
    playlists: [
      {
        name: "Cositas",
        created_on: new Date("2023-01-16"),
        contents: [
          {
            song: new ObjectId(300000000000000000000005),
            added_by: new ObjectId(400000000000000000000003),
            added_on: new Date("2023-01-28"),
          },
        ],
      },
    ],
  },
  {
    _id: new ObjectId(400000000000000000000004),
    username: "albita",
    email: "albarodriguez@email.com",
    password: "9876",
    date_of_birth: new Date("1999-12-31"),
    gender: "F",
    country: "Spain",
    postcode: "37002",
    premium_subscriber: true,
    subscription_details: {
      start_date: new Date("2023-01-28"),
      end_date: new Date("2023-02-28"),
      payment_method: "Card",
      card_details: {
        card_no: 487863678,
        expiry_date: new Date("2024-01-30"),
        CVV: 666,
      },
      past_payments: [
        {
          payment_method: "Card",
          date: new Date("2022-01-28"),
          amount: 9.95,
        },
      ],
    },
    favourites: [
      {
        album: new ObjectId(200000000000000000000002),
      },
    ],
  },
  {
    _id: new ObjectId(400000000000000000000005),
    username: "pierrot",
    email: "pierrelegrand@email.com",
    password: "7777",
    date_of_birth: new Date("1983-10-08"),
    gender: "M",
    country: "France",
    postcode: "31100",
    premium_subscriber: false,
    favourites: [
      {
        song: new ObjectId(300000000000000000000001),
      },
      {
        song: new ObjectId(300000000000000000000009),
      },
      {
        song: new ObjectId(300000000000000000000003),
      },
    ],
    following: [
      {
        artist: new ObjectId(100000000000000000000003),
      },
      {
        artist: new ObjectId(100000000000000000000001),
      },
    ],
  },
];

const addArtists = async (client, artists) => {
  await client.db("spotify").collection("artists").insertMany(artists);
  console.log("Artists successfully added to database");
};

const addUsers = async (client, users) => {
  await client.db("spotify").collection("users").insertMany(users);
  console.log("Users successfully added to database");
};

const main = async () => {
  try {
    await client.connect();
    await client.db("admin").command({ ping: 1 });
    console.log("Connected successfully to server");
    const databases = await client.db().admin().listDatabases();
    let spotify_exists = databases.databases.filter(
      (element) => element.name === "spotify"
    );
    if (spotify_exists) {
      await client.db("spotify").dropDatabase();
    }
    await addArtists(client, artists);
    await addUsers(client, users);
  } finally {
    await client.close();
  }
};
main().catch(console.dir);
