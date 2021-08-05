const firebaseAdmin = require("firebase-admin");
const firebase = firebaseAdmin.initializeApp({
  databaseURL: "https://mezcalmos-31f1c-default-rtdb.firebaseio.com",
  storageBucket: "mezcalmos-31f1c.appspot.com"
}, "production");

const testFirebase = firebaseAdmin.initializeApp({
  databaseURL: "https://mezcalmos-test.firebaseio.com",
}, "test")

var bucket = firebase.storage().bucket();

function execShellCommand(cmd) {
  const exec = require('child_process').exec;
  return new Promise((resolve, reject) => {
    exec(cmd, (error, stdout, stderr) => {
      if (error) {
        console.warn(error);
      }
      resolve(stdout ? stdout : stderr);
    });
  });
}

async function main() {
  const [files] = await bucket.getFiles({ prefix: 'users' });

  for (let i = 0; i < files.length; i++) {
    let file = files[i]
    let userId = file.name.split('/')[1]

    let fileName = `./data/${userId}.jpg`
    if (file.metadata.size < 10000) {
      console.log(userId, fileName, file.metadata.size);
      console.log(file.metadata.mediaLink);
      await bucket.file(file.name).download({ destination: fileName })
      await execShellCommand(`sips -Z 500 ${fileName}`);
      await bucket.upload(fileName, { destination: file.name, public: true });
    }


  };
  process.exit()
}

main()

