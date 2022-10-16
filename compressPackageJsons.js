const process = require('process')
const fs = require('fs')
const allowedKeys = [
  'name',
  'version',
  'author',
  'license',
  'main',
  "engines",
  "oclif"
]

const filesToProcess = process.argv.slice(2)

for (const file of filesToProcess) {
  try {
    const original = JSON.parse(fs.readFileSync(file, 'utf-8'))
    const strippedVersion = {}
    for (const key of allowedKeys) {
      strippedVersion[key] = original[key]
    }
    fs.writeFileSync(file, JSON.stringify(strippedVersion))
  } catch (e) {
    console.error(`Error while compressing ${file}: ${JSON.stringify(e)}`)
  }
}
