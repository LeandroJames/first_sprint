// const { MongoClient, ObjectId } = require("mongodb");
// const uri = "mongodb://localhost:27017";
// const client = new MongoClient(uri);

const users = [
  {
    _id: new ObjectId(100000000000000000000001),
    username: "queen_elisabeth",
    password: "dieu_et_mon_droit",
    email: "ellie@buckingham.co.uk",
    date_of_birth: new Date("1926-04-21"),
    gender: "F",
    country: "United Kingdom",
    postcode: "SW1A 1AA",
    channels: [
      {
        _id: new ObjectId(300000000000000000000001),
        name: "Dead but not gone",
        description: "Royal news from beyond the grave",
        created_on: new Date("2022-09-08"),
        subscribers: [
          { _id: new ObjectId(100000000000000000000002) },
          { _id: new ObjectId(100000000000000000000003) },
          { _id: new ObjectId(100000000000000000000004) },
        ],
      },
    ],
    playlists: [
      {
        name: "random_stuff",
        created_on: new Date("2023-01-25"),
        status: "Private",
        contents: [
          new ObjectId(200000000000000000000001),
          new ObjectId(200000000000000000000003),
          new ObjectId(200000000000000000000005),
        ],
      },
    ],
  },
  {
    _id: new ObjectId("100000000000000000000002"),
    username: "coletas_pablo",
    password: "PODEMOS",
    email: "piglesiasturrion@universidad.edu",
    date_of_birth: new Date("1978-10-17"),
    gender: "M",
    country: "Spain",
    postcode: "28031",
    channels: [
      {
        _id: new ObjectId("300000000000000000000002"),
        name: "ElTornillo",
        description: "Entrevistas con agenda",
        created_on: new Date("2008-07-05"),
        contents: [{ _id: new ObjectId("200000000000000000000003") }],
      },
    ],
    videos: [
      {
        _id: new ObjectId("200000000000000000000003"),
        name: "Dialéctica Kantiana de la coleta",
        description:
          "Exposición eterna sobre por qué me necesitáis, nunca me equivoqué y me rogaréis que vuelva cuando os deis cuenta de vuestro error",
        size: 8954878,
        file_name: "horatoria.long",
        length: 370,
        times_played: 0,
        status: "Public",
        published_on: new Date("2022-01-26"),
        tags: ["pelo", "fisolofia", "sancheztraidor"],
        dislikes: [
          {
            user: new ObjectId("100000000000000000000004"),
            date: new Date("2022-08-09"),
          },
        ],
        comments: [
          {
            content: "Rojo flipao",
            written_by: { _id: new ObjectId("100000000000000000000003") },
            date: new Date("2022-08-09"),
            likes: [
              {
                user: new ObjectId("100000000000000000000004"),
                date: new Date("2022-08-09"),
              },
            ],
          },
        ],
      },
    ],
  },
  {
    _id: new ObjectId("100000000000000000000003"),
    username: "aYusItaMaddrizz",
    password: "pecas_el_perro",
    email: "isabelayuso@comunidaddemadrid.es",
    date_of_birth: new Date("1978-10-17"),
    gender: "F",
    country: "Spain",
    postcode: "28001",
    videos: [
      {
        _id: new ObjectId("200000000000000000000001"),
        title: "Yo de pinchos en pandemia",
        description: "Madrid siempre contra el comunismo",
        size: 15687,
        file_name: "bar_manolo.mp4",
        length: 165,
        times_played: 2,
        status: "Public",
        published_on: new Date("2020-05-22"),
        tags: ["canyas", "madrid", "quesejodatuex"],
        likes: [
          {
            user: new ObjectId("100000000000000000000004"),
            date: new Date("2020-05-22"),
          },
        ],
      },
      {
        _id: new ObjectId("200000000000000000000004"),
        title: "España es Madrid",
        description: "Ya lo sabías. Y muerte al comunismo",
        size: 1489,
        file_name: "ole_y_ole.mp4",
        length: 199,
        times_played: 320,
        status: "Public",
        published_on: new Date("2021-03-15"),
        tags: ["madrid", "vivaespinya", "iglesiasalahoguera"],
      },
      {
        _id: new ObjectId("200000000000000000000005"),
        title: "Mascarillas para todos",
        description:
          "No es corrupción porque las comprara mi hermano, ¡malpensados!",
        size: 630,
        file_name: "buena_tajada.unte",
        length: 263,
        times_played: 890,
        status: "Public",
        published_on: new Date("2022-08-09"),
        tags: ["fakenews", "mascarillas"],
        comments: [
          {
            content: "¡Ladrona!",
            written_by: new ObjectId("100000000000000000000002"),
            date: new Date("2022-08-09"),
            dislikes: [
              {
                user: new ObjectId("100000000000000000000004"),
                date: new Date("2022-08-09"),
              },
            ],
          },
        ],
      },
    ],
  },
  {
    _id: new ObjectId("100000000000000000000004"),
    username: "pamangoelmio",
    password: "motosmotos",
    email: "isacifu@email.es",
    date_of_birth: new Date("1964-07-01"),
    gender: "F",
    country: "Spain",
    postcode: "28001",
    videos: [
      {
        _id: new ObjectId("200000000000000000000002"),
        name: "Yo y mis cremitas pal pelo",
        description: "Este supermercado es baratísimo",
        size: 190007,
        file_name: "no_publicar_peligro.vd",
        length: 244,
        times_played: 7890,
        status: "Hidden",
        published_on: new Date("2020-05-22"),
        tags: ["mascarillas", "eroski", "pelo"],
      },
    ],
    playlists: [
      {
        name: "cosas",
        created_on: new Date("2023-01-27"),
        status: "Public",
        contents: [
          new ObjectId("200000000000000000000001"),
          new ObjectId("200000000000000000000005"),
        ],
      },
    ],
  },
];

db.youtube.users.insertMany(users)

// const addUsers = async (client, users) => {
//   await client.db("youtube").collection("users").insertMany(users);
//   console.log("Users successfully added to database");
// };

// const main = async () => {
//   try {
//     await client.connect();
//     await client.db("admin").command({ ping: 1 });
//     console.log("Connected successfully to server");
//     const databases = await client.db().admin().listDatabases();
//     let youtube_exists = databases.databases.filter(
//       (element) => element.name === "youtube"
//     );
//     if (youtube_exists) {
//       await client.db("youtube").dropDatabase();
//     }
//     await addUsers(client, users);
//   } finally {
//     await client.close();
//   }
// };
// main().catch(console.dir);
