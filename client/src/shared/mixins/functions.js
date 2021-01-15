import {
  firebaseStorage
} from '../config/firebase'
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
export const print = async (parent, ref) => {
  const el = parent.$refs[ref].$el;
  console.dir(el);
  let width = el.clientWidth
  let height = el.clientHeight
  // add option type to get the image version
  // if not provided the promise will return 
  // the canvas.
  const options = {
    type: 'dataURL',

    width: width,
    height: height,
    useCORS: true,
    taintTest: false,
    allowTaint: false,
    ignoreElements: (node) => {
      return node.nodeName === 'IFRAME';
    }
  }
  let output = await parent.$html2canvas(el, options);
  console.log('image declared ');

  firebaseStorage().ref('/directions/taxi').child('example').putString(output, 'data_url', {
    contentType: 'image/jpg'
  });
  return 'success'
};