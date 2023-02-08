const { readdir, readFile, writeFile } = require("fs");
const { join } = require("path");
const inbox = join(__dirname, "inbox");
const outbox = join(__dirname, "outbox");

const reverseText = (str) => str.split("").reverse().join("");

// Read and reverse contents of text files in a directory
const inboxContents = (inbox) => {
  return new Promise((resolve, reject) => {
    readdir(inbox, (error, files) =>
    error ? reject(new Error("Error: Folder inaccessible")) : resolve(files));
  });
};

const readInbox = (files) => {
  return new Promise ((resolve, reject) => {
    files.forEach((file)=>
      readFile(join(inbox, file), "utf8", (error, data) => {
      error ? reject(new Error("Error: File error")) : resolve(file, data);
  }))
})}

const writeOutbox = (file, data) => writeFile(join(outbox, file), reverseText(data), (error) => {
      error ? console.log("Error: File could not be saved!") : resolveconsole.log(`${file} was successfully saved in the outbox!`)
  })

const main = async () => {
  try {
    inboxContents(inbox)
    .then((value)=>readInbox(value))
    .then((value)=>writeOutbox(value));
  } catch (error) {
    console.log(error.message)
  }
}

main()

// // Read and reverse contents of text files in a directory
// const main = () => {
//   try {
//     const files = readdir(inbox, (error, files) => {
//       if (error) throw new Error ("Folder inaccessible")
//       return files})
//     files.forEach(file => {
//       readFile(join(inbox, file), "utf8", (error, data) => {
//         if (error) throw ("Error: File error");
//         writeFile(join(outbox, file), reverseText(data), error => {
//         if (error) return console.log("File could not be saved!");
//         console.log(`${file} was successfully saved in the outbox!`)})})})
//   } catch (error) {
//     console.log(error.message)
//   }
// }

// main()
