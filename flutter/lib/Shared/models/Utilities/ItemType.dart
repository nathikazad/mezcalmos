// enum ItemType { Daily, Special }

// extension ParseItemTypeToString on ItemType {
//   String toFirebaseFormatString() {
//     final String str = toString().split('.').last;
//     return str[0].toLowerCase() + str.substring(1);
//   }

//   String toNormalString() {
//     final String str = toString().split('.').last;

//     return str;
//   }
// }

// extension ParseStringToItemType on String {
//   ItemType toItemType() {
//     return ItemType.values.firstWhere((ItemType e) =>
//         e.toFirebaseFormatString().toLowerCase() == toLowerCase());
//   }
// }
