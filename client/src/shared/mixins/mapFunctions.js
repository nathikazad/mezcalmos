export function getDistanceFromLatLonInKm(from, to) {
  if (!from || !to || !from.lat || !to.lat || !from.lng || !to.lng) {
    return 0
  }
  var R = 6371; // Radius of the earth in km
  var dLat = deg2rad(from.lat - to.lat); // deg2rad below
  var dLon = deg2rad(from.lng - to.lng);
  var a =
    Math.sin(dLat / 2) * Math.sin(dLat / 2) +
    Math.cos(deg2rad(from.lat)) * Math.cos(deg2rad(to.lat)) *
    Math.sin(dLon / 2) * Math.sin(dLon / 2);
  var c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
  var d = R * c; // Distance in km
  return d;
}

function deg2rad(deg) {
  return deg * (Math.PI / 180)
}

export const puertoCoords = {
  lat: 15.851385774884324,
  lng: -97.04642977358667
}

const richPeopleCoords = {
  zicaOneCoords: {
    lat: 15.855195,
    lng: -97.060213,
    radius: 0.45
  },
  zicaTwoCoords: {
    lat: 15.851660,
    lng: -97.056928,
    radius: 0.45
  },
  zicaThreeCoords: {
    lat: 15.847764,
    lng: -97.053518,
    radius: 0.45
  },
  laPuntaCoords: {
    lat: 15.836948,
    lng: -97.044982,
    radius: 0.7
  },
  bacochoCoords: {
    lat: 15.864904,
    lng: -97.089591,
    radius: 0.625
  },
  rinconadaCoords: {
    lat: 15.861860,
    lng: -97.082549,
    radius: 0.7
  },
  aeropCoords: {
    lat: 15.873772,
    lng: -97.091928,
    radius: 0.25
  }
}

export function inRichPeopleCoords(from, to) {
  if (!from || !to || !from.lat || !to.lat || !from.lng || !to.lng) {
    return false
  }
  for (let idx in richPeopleCoords) {
    let currentCoord = richPeopleCoords[idx]
    // console.log("from: ", getDistanceFromLatLonInKm(from, currentCoord), currentCoord.radius)
    // console.log("to:   ", getDistanceFromLatLonInKm(to, currentCoord), currentCoord.radius)
    if (getDistanceFromLatLonInKm(from, currentCoord) < currentCoord.radius ||
      getDistanceFromLatLonInKm(to, currentCoord) < currentCoord.radius) {
      // console.log(idx)
      return true
    }
  }
  return false
}
export function nearestArea(areas, pos) {
  console.log('nearestArea');

  let nearestArea = null;
  let firstDistance = null;
  let firstName = null;
  if (areas) {
    firstDistance = getDistanceFromLatLonInKm(pos, Object.values(areas)[0].position) * 1000 - Object.values(areas)[0].distance;
    firstName = Object.values(areas)[0].name;
    nearestArea = {
      key: Object.keys(areas)[0],
      distance: firstDistance,
      name: firstName
    };

    for (const key in areas) {

      const area = areas[key];

      let distanceBetweenAreaAndPos = getDistanceFromLatLonInKm(pos, area.position) * 1000;
      if (nearestArea.distance > (distanceBetweenAreaAndPos - area.distance)) {
        nearestArea = {
          key: key,
          distance: distanceBetweenAreaAndPos - area.distance,
          name: area.name
        }
        console.log(nearestArea);

      }



    }
  }
  return nearestArea;
}