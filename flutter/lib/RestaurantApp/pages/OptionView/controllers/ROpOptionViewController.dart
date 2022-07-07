import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/models/Cart.dart';
import 'package:mezcalmos/RestaurantApp/controllers/restaurantInfoController.dart';
import 'package:mezcalmos/Shared/helpers/ImageHelper.dart';
import 'package:mezcalmos/Shared/models/Generic.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant.dart';

class ROpOptionViewController {
  // instances //
  RestaurantInfoController _restaurantInfoController =
      Get.find<RestaurantInfoController>();
  // Text inputs //
  TextEditingController prOptionName = TextEditingController();
  TextEditingController scOptionName = TextEditingController();
  TextEditingController costPerExtra = TextEditingController();

  // variables //
  Rxn<Restaurant> restaurant = Rxn();
  Rx<OptionType> optionType = Rx(OptionType.ChooseOne);
  RxList<Choice> optionChoices = RxList([]);
  RxnInt min = RxnInt();
  RxnInt max = RxnInt();
  RxnInt free = RxnInt();
  Rxn<Option> editableOption = Rxn<Option>();
  RxBool editMode = RxBool(false);

  List<TextEditingController> prChoicesNames = [];
  List<TextEditingController> scChoicesNames = [];
  List<TextEditingController> choicesPrices = [];

  // constants //
  final Map<LanguageType, String> _emptyName = {
    LanguageType.EN: "",
    LanguageType.ES: "",
  };

// init //
  void init({String? optionId, String? itemId}) {
    restaurant.value = _restaurantInfoController.restaurant.value;
    if (optionId != null && itemId != null) {
      editableOption.value = restaurant.value!
          .findItemById(itemId)
          ?.options
          .firstWhere((Option element) => element.id == optionId);
      initEditMode();
    }
  }

// when editing an existing option //
  void initEditMode() {
    if (editableOption.value != null) {
      editMode.value = true;
      optionType.value = editableOption.value!.optionType;
      prOptionName.text =
          editableOption.value!.name[restaurant.value!.primaryLanguage]!;
      scOptionName.text =
          editableOption.value!.name[restaurant.value!.secondaryLanguage]!;
      if (editableOption.value!.optionType == OptionType.Custom) {
        free.value = editableOption.value!.freeChoice as int;
        min.value = editableOption.value!.minimumChoice as int;
        max.value = editableOption.value!.maximumChoice as int;
        costPerExtra.text = editableOption.value!.costPerExtra.toString();
      }
      if (editableOption.value!.choices.isNotEmpty) {
        editableOption.value!.choices.forEach((Choice element) {
          optionChoices.add(element);
          choicesPrices.add(TextEditingController());
          prChoicesNames.add(TextEditingController());
          scChoicesNames.add(TextEditingController());
        });
      }
      if (optionChoices.isNotEmpty) {
        for (int i = 0; i < optionChoices.length; i++) {
          choicesPrices[i].text = optionChoices[i].cost.toString();
          prChoicesNames[i].text =
              optionChoices[i].name[restaurant.value!.primaryLanguage]!;
          scChoicesNames[i].text =
              optionChoices[i].name[restaurant.value!.secondaryLanguage]!;
        }
      }
    }
  }

  void switchOptionType(OptionType optionType) {
    this.optionType.value = optionType;
  }

  Option addOption() {
    if (optionType.value == OptionType.Custom) {
      return _constructCustomOption();
    } else {
      return _contructOption();
    }
  }

  Option _contructOption() {
    final Option newOption = Option(
        id: getRandomString(8),
        optionType: optionType.value,
        name: {
          restaurant.value!.primaryLanguage: prOptionName.text,
          restaurant.value!.secondaryLanguage!: scOptionName.text,
        },
        newChoices: _contructChoices());
    return newOption;
  }

  Option _constructCustomOption() {
    final Option newOption = Option(
        id: getRandomString(8),
        optionType: optionType.value,
        maximumChoice: max.value!,
        minimumChoice: min.value!,
        costPerExtra: int.tryParse(costPerExtra.text) ?? 0,
        freeChoice: free.value!,
        name: {
          restaurant.value!.primaryLanguage: prOptionName.text,
          restaurant.value!.secondaryLanguage!: scOptionName.text,
        },
        newChoices: _contructChoices());
    return newOption;
  }

  List<Choice> _contructChoices() {
    final List<Choice> data = [];
    for (int i = 0; i < optionChoices.length; i++) {
      data.add(Choice(
        id: optionChoices[i].id,
        name: {
          restaurant.value!.primaryLanguage: prChoicesNames[i].text,
          restaurant.value!.secondaryLanguage!: scChoicesNames[i].text,
        },
        cost: int.parse(choicesPrices[i].text),
      ));
    }
    return data;
  }

  void addNewEmptyChoice() {
    optionChoices
        .add(Choice(id: generateRandomString(8), name: _emptyName, cost: 0));
    choicesPrices.add(TextEditingController());
    prChoicesNames.add(TextEditingController());
    scChoicesNames.add(TextEditingController());
  }

  void deleteChoice(String choiceID) {
    optionChoices.removeWhere((Choice element) => element.id == choiceID);
  }
}
