// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';

class MinimumBsOrder {
  int id;
  String customerName;
  String customerImage;
  DateTime time;
  num cost;
  int numberOfItems;
  MinimumBsOrder({
    required this.id,
    required this.customerName,
    required this.customerImage,
    required this.time,
    required this.cost,
    required this.numberOfItems,
  });
}

class MinimumBusinessItem {
  int orderId;
  LanguageMap name;
  String image;
  BusinessItemParameters parameters;
  num cost;
  String customerName;
  DateTime time;
  MinimumBusinessItem({
    required this.orderId,
    required this.name,
    required this.image,
    required this.cost,
    required this.parameters,
    required this.customerName,
    required this.time,
  });
}
