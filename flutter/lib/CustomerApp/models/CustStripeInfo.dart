// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:mezcalmos/CustomerApp/models/Customer.dart';

class CustStripeInfo {
  String id;
  List<CreditCard> cards;
  CustStripeInfo({
    required this.id,
    required this.cards,
  });

  CustStripeInfo copyWith({
    String? id,
    List<CreditCard>? cards,
  }) {
    return CustStripeInfo(
      id: id ?? this.id,
      cards: cards ?? this.cards,
    );
  }

  factory CustStripeInfo.fromMap(Map<String, dynamic> map) {
    final List<CreditCard> cards = [];
    map["cards"].forEach((key, data) {
      cards.add(CreditCard.fromData(data: data));
    });
    return CustStripeInfo(id: map['id'] as String, cards: cards);
  }

  factory CustStripeInfo.fromJson(String source) =>
      CustStripeInfo.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'CustStripeInfo(id: $id, cards: $cards)';

  @override
  bool operator ==(covariant CustStripeInfo other) {
    if (identical(this, other)) return true;

    return other.id == id;
  }

  @override
  int get hashCode => id.hashCode ^ cards.hashCode;

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> mappedCards = {};
    cards.forEach((CreditCard card) {
      mappedCards[card.id] = card.toMap();
    });
    return <String, dynamic>{
      'id': id,
      'cards': mappedCards,
    };
  }

  String toJson() => json.encode(toMap());
}
