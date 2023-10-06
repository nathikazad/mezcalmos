enum CustDeliveryType { Chedraui, Pharmacy, Open, Fruits }

extension ParseCustDeliveryTypeToString on CustDeliveryType {
  String toFirebaseFormatString() {
    final String str = toString().split('.').last;
    return str[0].toLowerCase() + str.substring(1);
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
