// ignore_for_file: public_member_api_docs, sort_constructors_first
class CourierItem {
  String name;
  String? image;
  String? notes;
  num estCost;
  CourierItem({
    required this.name,
    this.image,
    this.notes,
    required this.estCost,
  });
}
