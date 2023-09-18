enum OfferOrderType {
  AnyOrder,
  FirstOrderOnly,
  ParticularService,
  ParticularCategory
}

extension ParseRoomTypeToString on OfferOrderType {
  String toFirebaseFormatString() {
    final String str = toString().split('.').last;
    return str[0].toLowerCase() + str.substring(1);
  }
}

extension ParseStringToRoomType on String {
  OfferOrderType toOfferOrderType() {
    return OfferOrderType.values.firstWhere((OfferOrderType roomType) =>
        roomType.toFirebaseFormatString().toLowerCase() == toLowerCase());
  }
}
