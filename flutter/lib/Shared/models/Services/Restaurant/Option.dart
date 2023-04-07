import 'package:get/get.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart' as cModels;
import 'package:mezcalmos/Shared/models/Services/Restaurant/Choice.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';

class Option {
  int id;
  OptionType optionType;
  Map<cModels.Language, String> name;
  int? nameId;
  List<Choice> choices;
  int position = 0;
  num minimumChoice = 0;
  num freeChoice = 0;
  num maximumChoice = 0;
  num costPerExtra = 0;

  List<Choice> get getChoices {
    sortChoices();
    return choices;
  }

  Option({
    required this.id,
    required this.optionType,
    required this.name,
    this.costPerExtra = 0,
    this.freeChoice = 0,
    this.maximumChoice = 0,
    this.nameId,
    this.minimumChoice = 0,
    List<Choice>? newChoices,
    this.position = 0,
  }) : choices = newChoices ?? <Choice>[];
  factory Option.fromData(int id, data) {
    final Option option = Option(
        id: id,
        name: convertToLanguageMap(data["name"]),
        position: data["position"] ?? 0,
        optionType: data["optionType"].toString().toOptionType());

    data["choices"]?.forEach((optionKey, optionData) {
      final Choice choice = Choice.fromData(optionKey, optionData);
      option.choices.add(choice);
    });
    option.sortChoices();
    option.changeOptionType(
      option.optionType,
      minimumChoice: data["minimumChoice"],
      freeChoice: data["freeChoice"],
      maximumChoice: data["maximumChoice"],
      costPerExtra: data["costPerExtra"],
    );
    return option;
  }
  bool get haveAtLeastOneChoiceAvailable {
    return choices
            .firstWhereOrNull((Choice element) => element.available == true) !=
        null;
  }

  void sortChoices() {
    choices.sort((Choice a, Choice b) => a.position.compareTo(b.position));
  }

  bool get haveAtLeastOnChoiceAvailable =>
      choices.firstWhereOrNull((Choice element) => element.available == true) !=
      null;

  void changeOptionType(
    OptionType optionType, {
    num? minimumChoice,
    num? freeChoice,
    num? maximumChoice,
    num? costPerExtra,
  }) {
    switch (optionType) {
      case OptionType.ChooseOne:
        this.minimumChoice = 1;
        this.freeChoice = 1;
        this.maximumChoice = 1;
        break;
      case OptionType.ChooseMany:
        this.minimumChoice = 0;
        this.freeChoice = choices.length;
        this.maximumChoice = choices.length;
        this.costPerExtra = 0;
        break;
      case OptionType.Custom:
        this.minimumChoice = minimumChoice ?? 0;
        this.freeChoice = freeChoice ?? 0;
        this.maximumChoice = maximumChoice ?? choices.length;
        this.costPerExtra = costPerExtra ?? 0;
        break;
    }
  }

  Choice? findChoice(Map<cModels.Language, String> name) {
    Choice? selected;
    choices.forEach((Choice choice) {
      if (choice.name.toFirebaseFormat().toString() ==
          name.toFirebaseFormat().toString()) selected = choice;
    });
    return selected;
  }

  Map<String, dynamic> _parseChoices(List<Choice> choices) {
    final Map<String, dynamic> _mappedChoices = <String, dynamic>{};
    choices.forEach((Choice ch) {
      _mappedChoices[ch.id.toString()] = ch.toJson();
    });

    return _mappedChoices;
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name.toFirebaseFormat(),
      "optionType": optionType.toFirebaseFormatString(),
      "choices": _parseChoices(choices),
      "minimumChoice": minimumChoice,
      "maximumChoice": maximumChoice,
      "costPerExtra": costPerExtra,
      "freeChoice": freeChoice,
    };
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        choices.hashCode ^
        position.hashCode ^
        minimumChoice.hashCode ^
        freeChoice.hashCode ^
        maximumChoice.hashCode ^
        costPerExtra.hashCode;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Option &&
        other.id == id &&
        other.position == position &&
        other.optionType == optionType &&
        other.minimumChoice == minimumChoice &&
        other.freeChoice == freeChoice &&
        other.maximumChoice == maximumChoice &&
        other.costPerExtra == costPerExtra;
  }

  Option copyWith({
    int? id,
    Map<cModels.Language, String>? name,
    int? nameId,
    List<Choice>? choices,
    int? position,
    num? minimumChoice,
    num? freeChoice,
    num? maximumChoice,
    num? costPerExtra,
  }) {
    final Option newOp = Option(
      id: id ?? this.id,
      name: name ?? this.name,
      nameId: nameId ?? this.nameId,
      // choices: choices ?? this.choices,
      position: position ?? this.position,
      minimumChoice: minimumChoice ?? this.minimumChoice,
      freeChoice: freeChoice ?? this.freeChoice,
      maximumChoice: maximumChoice ?? this.maximumChoice,
      costPerExtra: costPerExtra ?? this.costPerExtra,
      optionType: optionType,
    );
    choices?.forEach((Choice element) {
      newOp.choices.add(element);
    });
    return newOp;
  }
}

enum OptionType { ChooseOne, ChooseMany, Custom }

extension ParseOrderTypeToString on OptionType {
  String toFirebaseFormatString() {
    final String str = toString().split('.').last;
    return str[0].toLowerCase() + str.substring(1);
  }

  String toOptionName() {
    String str = toString().split('.').last;

    if (str.length > 6) {
      str = str.substring(6, str.length);
    }
    str[0].toLowerCase();
    return str;
  }
}

extension ParseStringToOrderType on String {
  OptionType toOptionType() {
    return OptionType.values
        .firstWhere((OptionType e) => e.toFirebaseFormatString() == this);
  }
}
