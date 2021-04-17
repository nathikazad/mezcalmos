export function getDistanceFromLatLonInKm(from, to) {
  if(!from || !to || !from.lat || !to.lat || !from.lng || !to.lng){
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
  return parseInt(d);
}

function deg2rad(deg) {
  return deg * (Math.PI / 180)
}

export const puertoCoords = {lat: 15.851385774884324, lng:-97.04642977358667}
