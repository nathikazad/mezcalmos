export const deepFind = (obj, path) => {
  if (obj) {
    var paths = path.split('.'),
      current = obj,
      i;

    for (i = 0; i < paths.length; ++i) {
      if (current[paths[i]] == undefined) {
        return undefined;
      } else {
        current = current[paths[i]];
      }
    }
    return current;
  } else {
    return undefined;
  }
};
export const geocodedAddress = (location) => {
  let geocoder = new window.google.maps.Geocoder();

  return new Promise(function (resolve, reject) {
    geocoder.geocode({
      location: location
    }, function (results, status) {
      if (status === "OK") {
        if (results[0]) {
          resolve(results[0].formatted_address);
        } else {
          reject("No results found");
        }
      }
    });
  });
}
//Polyline decoder
export const decode = function (value) {

  var values = decode.integers(value)
  var points = []

  for (var i = 0; i < values.length; i += 2) {
    points.push({
      lat: (values[i + 0] += (values[i - 2] || 0)) / 1e5,
      lng: (values[i + 1] += (values[i - 1] || 0)) / 1e5,
    })
  }

  return points

}

decode.sign = function (value) {
  return value & 1 ? ~(value >>> 1) : (value >>> 1)
}

decode.integers = function (value) {

  var values = []
  var byte = 0
  var current = 0
  var bits = 0

  for (var i = 0; i < value.length; i++) {

    byte = value.charCodeAt(i) - 63
    current = current | ((byte & 0x1F) << bits)
    bits = bits + 5

    if (byte < 0x20) {
      values.push(decode.sign(current))
      current = 0
      bits = 0
    }

  }

  return values

}