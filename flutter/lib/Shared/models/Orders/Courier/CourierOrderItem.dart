// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:mezcalmos/CustomerApp/models/CourierItem.dart';

class CourierOrdeItem extends CourierItem {
  bool unavailable;
  num orderId;
  num? actualCost;
  int id;
  CourierOrdeItem({
    required this.unavailable,
    required this.orderId,
    required this.actualCost,
    required this.id,
    required super.name,
    required super.image,
    required super.notes,
    required super.estCost,
  });
}
