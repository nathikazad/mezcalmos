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
          console.log(status);
          reject("No results found");
        }
      }
    });
  });
}