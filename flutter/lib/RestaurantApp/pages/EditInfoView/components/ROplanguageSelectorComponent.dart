import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['RestaurantApp']
    ['pages']['ROpEditInfoView']['components']['ROpLanguageSelectorComponent'];

typedef bool OnChangeShouldUpdateLang(
  LanguageType languageType,
);

class ROpLanguageSelectorComponent extends StatefulWidget {
  const ROpLanguageSelectorComponent({
    Key? key,
    required this.languageValue,
    this.oppositeLanguageValue,
    required this.onChangeShouldUpdateLang,
    this.showDeleteIcon = false,
  }) : super(key: key);

  final Rxn<LanguageType> languageValue;
  final Rxn<LanguageType>? oppositeLanguageValue;
  final OnChangeShouldUpdateLang onChangeShouldUpdateLang;
  final bool showDeleteIcon;

  @override
  State<ROpLanguageSelectorComponent> createState() =>
      _ROpLanguageSelectorComponentState();
}

class _ROpLanguageSelectorComponentState
    extends State<ROpLanguageSelectorComponent> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FormField<LanguageType>(
        builder: (FormFieldState<LanguageType> state) {
          return Obx(
            () => InputDecorator(
              decoration: InputDecoration(
                errorStyle: TextStyle(color: Colors.redAccent, fontSize: 16.0),
                filled: true,
                fillColor: Colors.grey.shade200,
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide.none),
                focusedBorder: InputBorder.none,

                isDense: true,
                // contentPadding: EdgeInsets.all(5),
                label: Text("${_i18n()["none"]}"),
                floatingLabelBehavior: FloatingLabelBehavior.never,
                suffixIcon: (widget.showDeleteIcon &&
                        widget.languageValue.value != null)
                    ? IconButton(
                        onPressed: () {
                          widget.languageValue.value = null;
                        },
                        icon: Icon(Icons.close))
                    : null,
              ),
              isEmpty: widget.languageValue.value == null,
              child: DropdownButtonHideUnderline(
                child: DropdownButton<LanguageType>(
                  value: widget.languageValue.value,
                  isDense: true,
                  dropdownColor: Colors.white,
                  onChanged: (LanguageType? newValue) {
                    if (newValue != null) {
                      final bool result =
                          widget.onChangeShouldUpdateLang(newValue);

                      if (result) {
                        widget.languageValue.value = newValue;
                        widget.languageValue.refresh();
                      }
                    }
                  },
                  items: [
                    LanguageType.EN,
                    LanguageType.ES,
                  ].map((LanguageType value) {
                    return DropdownMenuItem<LanguageType>(
                      value: value,
                      enabled: (widget.oppositeLanguageValue != null &&
                          widget.oppositeLanguageValue!.value != value),
                      child: (value.toLanguageName() != null)
                          ? Text(
                              value.toLanguageName()!,
                              style: Get.textTheme.bodyText2?.copyWith(
                                  fontWeight: FontWeight.w700,
                                  color: (widget.oppositeLanguageValue !=
                                              null &&
                                          widget.oppositeLanguageValue!.value ==
                                              value)
                                      ? Colors.grey
                                      : Colors.black),
                            )
                          : Container(),
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
}
