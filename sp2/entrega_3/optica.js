const MongoClient = require('mongodb').MongoClient;
var url = "mongodb+srv://leandroespanol:SilvioAstier23@cluster0.og3s1v9.mongodb.net/optica";

MongoClient.connect(url, function(err, db) {
  if (err) throw err;
  console.log("Database created!");
  db.close();
});