import 'dart:math';

import 'package:flutter/foundation.dart' as fd;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/RestaurantApp/controllers/restaurantInfoController.dart';
import 'package:mezcalmos/Shared/MezRouter.dart';
import 'package:mezcalmos/Shared/graphql/item/option/hsOption.dart';
import 'package:mezcalmos/Shared/graphql/restaurant/hsRestaurant.dart';
import 'package:mezcalmos/Shared/graphql/translation/hsTranslation.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant/Choice.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant/Option.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';

enum FormValid { Valid, PrimaryNotValid, SecondaryNotValid }

class ROpOptionViewController {
  // instances //
  late RestaurantInfoController restaurantInfoController;

  // Text inputs //
  TextEditingController prOptionName = TextEditingController();
  TextEditingController scOptionName = TextEditingController();
  TextEditingController costPerExtra = TextEditingController();

  // form//
  bool firstTabValid = false;
  bool secondTabValid = false;

  // variables //

  Rx<OptionType> optionType = Rx(OptionType.ChooseOne);
  RxList<Choice> optionChoices = RxList([]);
  Rx<LanguageType> primaryLang = Rx(LanguageType.ES);
  Rx<LanguageType> secondaryLang = Rx(LanguageType.EN);

  RxnInt min = RxnInt();
  RxnInt max = RxnInt();
  RxnInt free = RxnInt();
  Rxn<Option> editableOption = Rxn<Option>();
  RxBool editMode = RxBool(false);
  RxBool initDone = RxBool(false);
  RxBool needToFetch = RxBool(false);

  // constants //
  int? itemId;

  // getters //
  bool get isEditing => editMode.value && editableOption.value != null;

  late int restaurantId;

// init //
  Future<void> init(
      {String? optionId,
      required String restaurantId,
      required String itemID}) async {
    this.restaurantId = int.parse(restaurantId);
    itemId = int.tryParse(itemID);
    await _assignLanguages(restaurantId);
    if (optionId != null && int.tryParse(optionId) != null) {
      // launch edit mode //
      await _initEditMode(int.parse(optionId));
    } else {
      // add new option mode //

    }
    initDone.value = true;
  }

  /// Getting primary language and secondary language based on restuarant info
  Future<void> _assignLanguages(String restaurantId) async {
    if (int.tryParse(restaurantId) != null) {
      primaryLang.value =
          await get_restaurant_priamry_lang(int.parse(restaurantId)) ??
              LanguageType.ES;
      secondaryLang.value = primaryLang.value.toOpLang();
    }
  }

  /// When editing an existing option
  ///
  /// Load option info and assign them to view
  Future<void> _initEditMode(int optionId) async {
    editableOption.value = await get_option_by_id(optionId);
    if (editableOption.value != null) {
      editMode.value = true;
      optionType.value = editableOption.value!.optionType;
      prOptionName.text = editableOption.value!.name[primaryLang.value]!;
      scOptionName.text = editableOption.value!.name[secondaryLang.value]!;
      if (editableOption.value!.optionType == OptionType.Custom) {
        free.value = editableOption.value!.freeChoice as int;
        min.value = editableOption.value!.minimumChoice as int;
        max.value = editableOption.value!.maximumChoice as int;
        costPerExtra.text = editableOption.value!.costPerExtra.toString();
      }
      _assignChoices();
    }
  }

  void _assignChoices() {
    optionChoices.clear();
    editableOption.value!.choices.forEach((Choice element) {
      optionChoices.add(element);
    });
  }

// form validation //

  void switchOptionType(OptionType optionType) {
    this.optionType.value = optionType;
  }

  Future<void> saveOption() async {
    if (isEditing == false) {
      await _addNewOption();
    } else {
      await _updateOption();
    }
  }

  Future<void> _updateOption() async {
    await _updateName();
    final bool result = await update_option_by_id(
        optionId: editableOption.value!.id,
        option: (optionType.value == OptionType.Custom)
            ? _constructCustomOption()
            : _contructOption());
    if (result) {
      Get.snackbar('Saved', 'Option saved successfuly',
          backgroundColor: Colors.black,
          colorText: Colors.white,
          shouldIconPulse: false,
          icon: Icon(
            Icons.check_circle,
            color: Colors.green,
          ));
      needToFetch.value = true;
    }
  }

  Future<void> _addNewOption() async {
    mezDbgPrint("Adding new option to db ...");

    final int? newOptionID = await add_option(
        itemId: itemId!, restaurantId: restaurantId, option: _contructOption());
    if (newOptionID != null) {
      Get.snackbar('Saved', 'Option saved successfuly',
          backgroundColor: Colors.black,
          colorText: Colors.white,
          shouldIconPulse: false,
          icon: Icon(
            Icons.check_circle,
            color: Colors.green,
          ));
      editableOption.value = await get_option_by_id(newOptionID);
      if (editableOption.value != null) {
        editMode.value = true;
        needToFetch.value = true;
      }
    }
  }

  Option _contructOption() {
    if (optionType.value == OptionType.Custom)
      return _constructCustomOption();
    else
      return _contructNormalOption();
  }

  Option _contructNormalOption() {
    final Option newOption = Option(
      id: editMode.value ? editableOption.value!.id : Random().nextInt(15),
      optionType: optionType.value,
      name: {
        primaryLang.value: prOptionName.text,
        secondaryLang.value: scOptionName.text,
      },
    );
    return newOption;
  }

  Option _constructCustomOption() {
    final Option newOption = Option(
      id: editMode.value ? editableOption.value!.id : Random().nextInt(15),
      optionType: optionType.value,
      maximumChoice: max.value!,
      minimumChoice: min.value!,
      costPerExtra: int.tryParse(costPerExtra.text) ?? 0,
      freeChoice: free.value!,
      name: {
        primaryLang.value: prOptionName.text,
        secondaryLang.value: scOptionName.text,
      },
      // newChoices: _contructChoices(),
    );
    return newOption;
  }

  Future<bool?> deleteOption() async {
    final bool result =
        await delete_option_by_id(optionId: editableOption.value!.id);
    result ? MezRouter.back() : null;
    return result;
  }

  Future<void> fetchOption() async {
    if (isEditing) {
      final Option? newOp =
          await get_option_by_id(editableOption.value!.id, withCache: false);
      if (newOp != null) {
        editableOption.value = newOp.copyWith();
        editableOption.value!.choices = newOp.choices;

        _assignChoices();
      }
    }
  }

  Future<void> _updateName() async {
    mezDbgPrint(
        "UPDATE NAME ${!fd.mapEquals(editableOption.value!.name, _contructOption().name)}");
    if (!fd.mapEquals(editableOption.value!.name, _contructOption().name)) {
      _contructOption().name.forEach((LanguageType key, String value) async {
        mezDbgPrint("updatttttt ${editableOption.value?.nameId}");
        await update_translation(
            langType: key,
            value: value,
            translationId: editableOption.value!.nameId!);
      });
    }
  }

  bool get isFirstValid {
    return prOptionName.text.removeAllWhitespace.isNotEmpty;
  }

  bool get isSecondValid {
    return scOptionName.text.removeAllWhitespace.isNotEmpty;
  }
}
