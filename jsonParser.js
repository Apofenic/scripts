const fs = require("fs")
const path = require("path")
const countiesJson = require('../congressDistricts.json')
const fips = require('./fips.json')
const { exec } = require('child_process');


// console.log(list.length)
// console.log(Object.entries(fips).length)
Object.entries(fips).map(fip => {
  const list = countiesJson.features.filter((ft) => ft.properties.STATE === fip[0])
  const filePath = `./usDistrictsJSONS/${fip[1]}_districts.json`
  const countyObj = {
    geoJSON:{
      type:"FeatureCollection",
      features: list
    }
  }
  const objStr = JSON.stringify(countyObj, null, 2)
  fs.writeFile( filePath, objStr , err => {
    if(err) throw err
    console.log('success')
  })
})

