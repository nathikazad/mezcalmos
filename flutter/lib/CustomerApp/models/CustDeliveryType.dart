enum CustDeliveryType { Chedraui, Pharmacy, Open, Fruits }

extension ParseCustDeliveryTypeToString on CustDeliveryType {
  String toFirebaseFormatString() {
    final String str = toString().split('.').last;
    return str[0].toLowerCase() + str.substring(1);
  }

  String get imageAsset {
    return "assets/images/customer/custDelivery/${toFirebaseFormatString()}.png";
  }
}

extension ParseStringToCustDeliveryType on String {
  CustDeliveryType toCustDeliveryType() {
    return CustDeliveryType.values.firstWhere(
        (CustDeliveryType CustDeliveryType) =>
            CustDeliveryType.toFirebaseFormatString().toLowerCase() ==
            toLowerCase());
  }
}
