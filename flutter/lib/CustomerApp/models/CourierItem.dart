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
    // final String optionChoices =
    //     chosenChoices.entries.map((MapEntry<String, List<Choice>> entry) {
    //   final String? optionName = item
    //       .findOption(int.parse(entry.key))
    //       ?.name
    //       .getTranslation(userLanguage)
    //       .toString();

    //   final String choiceList = entry.value.map((Choice choice) {
    //     String choiceText = choice.name.getTranslation(userLanguage) ?? "";
    //     if (choice.cost > 0) {
    //       choiceText += " + \$${choice.cost.round()}";
    //     }

    //     return "     -$choiceText";
    //   }).join("\n");

    //   return "  -$optionName:\n$choiceList";
    // }).join("\n");

    // final String choicesSection =
    //     optionChoices.isNotEmpty ? "$optionChoices" : '';

    final String notesSection =
        notes?.isNotEmpty == true ? "Item notes: $notes," : '';

    final String data = "* $name: \$${estCost?.round()} " +
        (notesSection.isNotEmpty ? "\n  $notesSection" : '') +
        "\n";

    return data;
  }
}
