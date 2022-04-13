import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/LaundryApp/pages/EditInfoView/controllers/EditInfoController.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Generic.dart';

typedef bool OnChangeShouldUpdateLang(
  LanguageType languageType,
);

class LanguageSelectorComponent extends StatefulWidget {
  const LanguageSelectorComponent({
    Key? key,
    required this.languageValue,
    required this.onChangeShouldUpdateLang,
    this.showDeleteIcon = false,
    // required this.languagePriority,
    // required this.laundry,
  }) : super(key: key);
  // final LanguagePriority languagePriority;
  // final Laundry laundry;
  final Rxn<LanguageType> languageValue;
  final OnChangeShouldUpdateLang onChangeShouldUpdateLang;
  final bool showDeleteIcon;
  //final Rxn<String> oppositeLangValue;

  @override
  State<LanguageSelectorComponent> createState() =>
      _LanguageSelectorComponentState();
}

class _LanguageSelectorComponentState extends State<LanguageSelectorComponent> {
  EditInfoController editInfoController = EditInfoController();
  // String? _currentSelectedValue;

  @override
  void initState() {
    mezDbgPrint("innnnit state");
    //  editInfoController.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    mezDbgPrint("Rebuiils");

    return Container(
      child: FormField<LanguageType>(
        builder: (FormFieldState<LanguageType> state) {
          return Obx(
            () => InputDecorator(
              decoration: InputDecoration(
                  errorStyle:
                      TextStyle(color: Colors.redAccent, fontSize: 16.0),
                  filled: true,
                  fillColor: Colors.white,
                  isDense: true,
                  label: Text("None"),
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  suffixIcon: (widget.showDeleteIcon &&
                          widget.languageValue.value != null)
                      ? IconButton(
                          onPressed: () {
                            widget.languageValue.value = null;
                          },
                          icon: Icon(Icons.close))
                      : null,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0))),
              isEmpty: widget.languageValue.value == null,
              child: DropdownButtonHideUnderline(
                child: DropdownButton<LanguageType>(
                  value: widget.languageValue.value,
                  isDense: true,
                  onChanged: (LanguageType? newValue) {
                    if (newValue != null) {
                      //mezDbgPrint(newValue);

                      final bool result =
                          widget.onChangeShouldUpdateLang(newValue);
                      // mezDbgPrint("$result");

                      if (result) {
                        widget.languageValue.value = newValue;
                        widget.languageValue.refresh();
                      }
                    }
                    // if (newValue != newPrimaryLanguage) {
                    //   setState(() {
                    //     newSecondaryLanguage = newValue;
                    //   });
                    // } else {
                    //   Get.snackbar("Error",
                    //       "Primary and secondary launguage can't be the same language");
                    // }
                  },
                  items: [
                    LanguageType.EN,
                    LanguageType.ES,
                  ].map((LanguageType value) {
                    return DropdownMenuItem<LanguageType>(
                      value: value,
                      child: Row(children: [
                        CircleAvatar(
                          radius: 10,
                          backgroundImage: AssetImage(getRightFlag(value)),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(getRightName(value))
                      ]),
                    );
                  }).toList(),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  // void setSecondaryLang(String? value) {
  //   if (newPrimaryLanguage != null) {
  //     if (value != newPrimaryLanguage) {
  //       setState(() {
  //         newSecondaryLanguage = value;
  //       });
  //     } else {
  //       Get.snackbar("Error", "Same languge");
  //     }
  //   } else {
  //     Get.snackbar("Error", "Put primary first");
  //   }
  //   mezDbgPrint("Primarry -------------> $newPrimaryLanguage");
  //   mezDbgPrint("Secodary -------------> $newPrimaryLanguage");
  // }

  // void setPrimaryLanguage(String? value) {
  //   if (newSecondaryLanguage != null) {
  //     if (value != newSecondaryLanguage) {
  //       setState(() {
  //         newPrimaryLanguage = value;
  //       });
  //     } else {
  //       Get.snackbar("Error", "Same language");
  //     }
  //   } else {
  //     setState(() {
  //       newPrimaryLanguage = value;
  //     });
  //   }
  //   mezDbgPrint("Primarry -------------> $newPrimaryLanguage");
  //   mezDbgPrint("Secodary -------------> $newPrimaryLanguage");
  // }

//   String? getLanguageName() {
//     if (widget.languagePriority == LanguagePriority.PrimaryLanguage) {
//       //  return toLanguageName(laundry.primaryLanguage);
//       return editInfoController.primaryLang.value;
//     } else {
//       //  return toLanguageName(laundry.secondaryLanguage);
//       return editInfoController.secondaryLang.value;
//     }
//   }
// }
}

String getRightFlag(LanguageType value) {
  switch (value) {
    case LanguageType.EN:
      return aUsaFlag;

    case LanguageType.ES:
      return aMexicoFlag;

    default:
      return "";
  }
}

String getRightName(LanguageType value) {
  switch (value) {
    case LanguageType.EN:
      return "English";

    case LanguageType.ES:
      return "Spanish";

    default:
      return "";
  }
}

String getRightLabel(LanguagePriority languagePriority) {
  switch (languagePriority) {
    case LanguagePriority.PrimaryLanguage:
      return "Select Primary language";

    case LanguagePriority.SecondaryLanguage:
      return "None";

    default:
      return "None";
  }
}

String? toLanguageName(LanguageType? languageType) {
  if (languageType != null) {
    switch (languageType) {
      case LanguageType.EN:
        return "English";
      case LanguageType.ES:
        return "Spanish";

      default:
        return null;
    }
  } else {
    return null;
  }
}
