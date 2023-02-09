const { readdir, readFile, writeFile } = require("fs");
const { join } = require("path");
const inbox = join(__dirname, "inbox");
const outbox = join(__dirname, "outbox");

const reverseText = (str) => str.split("").reverse().join("");

const saveError = (error) => {
  if (error) throw new Error("File could not be saved!");
};

const readReverseCreate = (file) => {
  readFile(join(inbox, file), "utf8", (error, data) => {
    if (error) throw new Error("File error");
    writeFile(join(outbox, file), reverseText(data), saveError);
  });
  console.log(`${file} was successfully saved in the outbox!`);
};

try {
  readdir(inbox, (error, files) => {
    if (error) throw new Error("Folder inaccessible");
    files.forEach(readReverseCreate);
  });
} catch (error) {
  console.log(error.message);
}
