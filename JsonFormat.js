const fs = require("fs")
const path = require("path")
const refData = require('./UScities.json')
const states = require('./state.json')
const cities = require('./city.json')
const zips = require('./zip.json')
const { exec } = require('child_process')

const filePath = `./geoData.json`

 // console.log(zips)
const stateObj = states.state.map(st => {
  return {
    state:st,
  }
})
// console.log(stateObj)

const sortedGeo = stateObj.map(st => {
  return {
    ...st,
    cities: [
      ...new Set(
        refData.map(dt => {
          if(dt.state === st.state){
            // const foundVal = cities.city.find(str => str === dt.city)
            return dt.city

          }
          return null
        }).filter(n => n),
      )
    ],
    zip_codes:[
      ... new Set(
        refData.map(dt => {
          if(dt.state === st.state){
            if(dt.zip_code.toString().length !== 5){
              const corrector = z => {
                const newZip = '0'.concat(z)
                if(newZip.length !== 5) return corrector(newZip)
                // console.log(newZip)
                return newZip
              }
              return zips.zip.find(z => z === corrector(dt.zip_code.toString()))
              // return corrector(dt.zip_code.toString())
            }
            return zips.zip.find(z => z === dt.zip_code.toString())
            // return dt.zip_code.toString()
          }
          return null
        }).filter( n => n )
      )
    ]
  }
})


// console.log(sortedGeo)


const objStr = 
      fs.writeFile( './geoData.json', JSON.stringify(sortedGeo, null, 2) , err => {
    if(err) throw err
    console.log('success')
  })

