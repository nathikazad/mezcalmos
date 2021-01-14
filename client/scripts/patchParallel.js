const fs = require('fs');
let oldString = "process.versions.node < '8.0.0'"
let newString = "parseInt(process.versions.node) < 8"
let filename = 'node_modules/parallelshell/index.js'

fs.writeFileSync(
  filename,
  fs.readFileSync(filename, "utf8").replace(new RegExp(oldString,"g"), newString)
)

// console.log(fs.readFileSync(filename, "utf8").replace(new RegExp("process.versions.node < '8.0.0'","g"), "parseInt(process.versions.node) < 8"))