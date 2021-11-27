import 'package:flutter/material.dart';
import 'package:mezcalmos/CustomerApp/pages/Taxi/componenets/FromToLocationBar.dart';
import 'package:mezcalmos/Shared/helpers/MapHelper.dart';

typedef ExtensionSetState = void Function(VoidCallback fn);

// this is user  as class that we have an extension on
class FromToLocationBarHelper extends ChangeNotifier {
  GlobalKey<FromToLocationBarState> parentKey;
  FromToLocationBarHelper(this.parentKey);

  // Widget related instance variables
  double pickChoicesDropDownHeight = 0;

  void collapse() {
    pickChoicesDropDownHeight = 0;
    notifyListeners();
  }

  void expand() {
    pickChoicesDropDownHeight = 100;
    notifyListeners();
  }
}

// extension FromToLocationBarExtension on FromToLocationBar {
//   // we call this from outside and inside.
//   static void setStateFunction(
//       ExtFromToLocationBarClass _,
//       GlobalKey<FromToLocationBarState> parentKey,
//       ExtensionSetState setStater) {
//     _.setParentKey(parentKey, setStater);
//   }
// }
