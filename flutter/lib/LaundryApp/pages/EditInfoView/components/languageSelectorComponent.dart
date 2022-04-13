import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/LaundryApp/pages/EditInfoView/controllers/EditInfoController.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Generic.dart';
import 'package:mezcalmos/Shared/models/Services/Laundry.dart';

class LanguageSelectorComponent extends StatefulWidget {
  const LanguageSelectorComponent({
    Key? key,
    required this.languagePriority,
    required this.laundry,
  }) : super(key: key);
  final LanguagePriority languagePriority;
  final Rxn<Laundry> laundry;

  @override
  State<LanguageSelectorComponent> createState() =>
      _LanguageSelectorComponentState();
}

class _LanguageSelectorComponentState extends State<LanguageSelectorComponent> {
  EditInfoController editInfoController = EditInfoController();
  // String? _currentSelectedValue;
  String? newPrimaryLanguage;
  String? newSecondaryLanguage;
  @override
  void initState() {
    newPrimaryLanguage = toLanguageName(widget.laundry.value!.primaryLanguage);
    newSecondaryLanguage =
        toLanguageName(widget.laundry.value!.secondaryLanguage);

    mezDbgPrint("innnnit state");
    // editInfoController.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FormField<String>(
        builder: (FormFieldState<String> state) {
          return InputDecorator(
            decoration: InputDecoration(
                errorStyle: TextStyle(color: Colors.redAccent, fontSize: 16.0),
                filled: true,
                fillColor: Colors.white,
                isDense: true,
                label: Text(getRightLabel(widget.languagePriority)),
                floatingLabelBehavior: FloatingLabelBehavior.never,
                suffixIcon: (widget.languagePriority ==
                            LanguagePriority.SecondaryLanguage &&
                        getLanguageName() != null)
                    ? IconButton(
                        onPressed: () {
                          editInfoController.secondaryLang.value = null;
                          setState(() {
                            newSecondaryLanguage = null;
                          });
                        },
                        icon: Icon(Icons.delete))
                    : null,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0))),
            isEmpty: getLanguageName() == null,
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: getLanguageName(),
                isDense: true,
                onChanged: (String? newValue) {
                  if (widget.languagePriority ==
                      LanguagePriority.PrimaryLanguage) {
                    setPrimaryLanguage(newValue);
                  } else if (widget.languagePriority ==
                      LanguagePriority.SecondaryLanguage) {
                    setSecondaryLang(newValue);
                  }
                  //   if (newValue != newPrimaryLanguage) {
                  //     setState(() {
                  //       newSecondaryLanguage = newValue;
                  //     });
                  //   } else {
                  //     Get.snackbar("Error",
                  //         "Primary and secondary launguage can't be the same language");
                  //   }
                  // }
                  mezDbgPrint("primary $newPrimaryLanguage");
                  mezDbgPrint("Secondary $newSecondaryLanguage");
                },
                items: [
                  "English",
                  'Spanish',
                ].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Row(children: [
                      CircleAvatar(
                        radius: 10,
                        backgroundImage: AssetImage(getRightFlag(value)),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(value)
                    ]),
                  );
                }).toList(),
              ),
            ),
          );
        },
      ),
    );
  }

  void setSecondaryLang(String? value) {
    mezDbgPrint("SEEEEEET SECOND WHILE PRIMARY === $newPrimaryLanguage");
    if (newPrimaryLanguage != null) {
      if (value != newPrimaryLanguage) {
        setState(() {
          
          newSecondaryLanguage = value;
        });
      } else {
        Get.snackbar("Error", "Error");
      }
    }
  }

  void setPrimaryLanguage(String? value) {
    if (newSecondaryLanguage != null) {
      mezDbgPrint("SETTING PRIMARY AND SEC NOT NULL");
      if (value != newSecondaryLanguage) {
        setState(() {
          newPrimaryLanguage = value;
        });
      } else {
        Get.snackbar("Error", "Error");
      }
    } else {
      mezDbgPrint("SETTING PRIMARY AND SEC IS NULL");
      setState(() {
        newPrimaryLanguage = value;
      });
    }
  }

  String? getLanguageName() {
    if (widget.languagePriority == LanguagePriority.PrimaryLanguage) {
      //  return toLanguageName(laundry.primaryLanguage);
      return newPrimaryLanguage;
    } else {
      //  return toLanguageName(laundry.secondaryLanguage);
      return newSecondaryLanguage;
    }
  }
}

String getRightFlag(String value) {
  switch (value) {
    case "English":
      return aUsaFlag;

    case "Spanish":
      return aMexicoFlag;

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
