// ignore_for_file: public_member_api_docs, sort_constructors_first

class CourierItem {
  String name;
  String? image;
  String? notes;
  num? estCost;
  CourierItem({
    required this.name,
    this.image,
    this.notes,
    this.estCost,
  });
  String toReadableString() {
    final String notesSection =
        notes?.isNotEmpty == true ? " > Notes: $notes," : '';

    final String data = "* $name: \$${estCost?.round()} " +
        (notesSection.isNotEmpty ? "\n  $notesSection" : '') +
        "\n";

    return data;
  }
}
