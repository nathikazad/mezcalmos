import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/ContextHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';

dynamic _i18n() =>
    Get.find<LanguageController>().strings['RestaurantApp']['pages']
        ['ROpEditInfoView']['components']['ServiceLanguageSelectorComponent'];

typedef void OnChangeShouldUpdateLang(
  Language languageType,
);

class ServiceLanguageSelectorComponent extends StatefulWidget {
  const ServiceLanguageSelectorComponent({
    Key? key,
    required this.languageValue,
    this.oppositeLanguageValue,
    required this.onChangeShouldUpdateLang,
    this.isSecondary = false,
  }) : super(key: key);

  final Rxn<Language> languageValue;
  final Rxn<Language>? oppositeLanguageValue;
  final OnChangeShouldUpdateLang onChangeShouldUpdateLang;
  final bool isSecondary;

  @override
  State<ServiceLanguageSelectorComponent> createState() =>
      _ServiceLanguageSelectorComponentState();
}

class _ServiceLanguageSelectorComponentState
    extends State<ServiceLanguageSelectorComponent> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FormField<Language>(
        builder: (FormFieldState<Language> state) {
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
                // suffixIcon: (widget.showDeleteIcon &&
                //         widget.languageValue.value != null)
                //     ? IconButton(
                //         onPressed: () {
                //           widget.languageValue.value = null;
                //         },
                //         icon: Icon(Icons.close))
                //     : null,
              ),
              isEmpty: widget.languageValue.value == null,
              child: DropdownButtonHideUnderline(
                child: DropdownButton<Language>(
                  value: widget.languageValue.value,
                  isDense: true,
                  iconSize: (widget.isSecondary) ? 0 : 24,
                  dropdownColor: Colors.white,
                  onChanged: widget.isSecondary
                      ? null
                      : (Language? newValue) {
                          if (newValue != null) {
                            widget.onChangeShouldUpdateLang(newValue);
                          }
                        },
                  items: [
                    Language.EN,
                    Language.ES,
                  ].map((Language value) {
                    return DropdownMenuItem<Language>(
                      value: value,
                      child: (value.toLanguageName() != null)
                          ? Text(
                              value.toLanguageName()!,
                              style: context.txt.bodyMedium?.copyWith(
                                fontWeight: FontWeight.w700,
                              ),
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
