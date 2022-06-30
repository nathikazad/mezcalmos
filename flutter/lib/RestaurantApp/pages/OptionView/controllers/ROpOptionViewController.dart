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

  // variables //
  Rxn<Restaurant> restaurant = Rxn();
  Rx<OptionType> optionType = Rx(OptionType.ChooseOne);
  RxList<Choice> optionChoices = RxList([]);

  List<TextEditingController> prChoicesNames = [];
  List<TextEditingController> scChoicesNames = [];
  List<TextEditingController> choicesPrices = [];

  // constants //
  final Map<LanguageType, String> _emptyName = {
    LanguageType.EN: "",
    LanguageType.ES: "",
  };

// init //
  void init() {
    restaurant.value = _restaurantInfoController.restaurant.value;
  }

// when editing an existing option //
  void initEditMode() {}

  void switchOptionType(OptionType optionType) {
    this.optionType.value = optionType;
  }

  Option contructOption() {
    final Option newOption = Option(
        id: getRandomString(8),
        optionType: optionType.value,
        name: {
          restaurant.value!.primaryLanguage: prOptionName.text,
          restaurant.value!.secondaryLanguage!: scOptionName.text,
        },
        choices: optionChoices);
    return newOption;
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
