import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Generic.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['LaundryApp']['pages']
    ['EditInfoView']['components']['LanguageSelectorComponent'];

typedef bool OnChangeShouldUpdateLang(
  LanguageType languageType,
);

class LanguageSelectorComponent extends StatefulWidget {
  const LanguageSelectorComponent({
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
  State<LanguageSelectorComponent> createState() =>
      _LanguageSelectorComponentState();
}

class _LanguageSelectorComponentState extends State<LanguageSelectorComponent> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Obx(
        () => DropdownButtonFormField<LanguageType>(
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey.shade200,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide.none),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide.none),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide.none),
            focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide.none),
            label: Text("${_i18n()["none"]}"),
            floatingLabelBehavior: FloatingLabelBehavior.never,
            suffixIcon:
                (widget.showDeleteIcon && widget.languageValue.value != null)
                    ? IconButton(
                        onPressed: () {
                          widget.languageValue.value = null;
                        },
                        icon: Icon(
                          Icons.close,
                          color: Colors.black,
                        ))
                    : null,
          ),
          value: widget.languageValue.value,
          onChanged: (LanguageType? newValue) {
            if (newValue != null) {
              final bool result = widget.onChangeShouldUpdateLang(newValue);

              if (result) {
                widget.languageValue.value = newValue;
                widget.languageValue.refresh();
              }
            }
          },
          validator: (LanguageType? value) {
            if (value == null) {
              return "${_i18n()["errorText"]}";
            } else {
              return null;
            }
          },
          items: [
            LanguageType.EN,
            LanguageType.ES,
          ].map<DropdownMenuItem<LanguageType>>((LanguageType value) {
            return DropdownMenuItem<LanguageType>(
              value: value,
              enabled: (widget.oppositeLanguageValue != null &&
                  widget.oppositeLanguageValue!.value != value),
              child: (value.toLanguageName() != null)
                  ? Text(
                      value.toLanguageName()!,
                      style: Get.textTheme.bodyText2?.copyWith(
                          fontWeight: FontWeight.w700,
                          color: (widget.oppositeLanguageValue != null &&
                                  widget.oppositeLanguageValue!.value == value)
                              ? Colors.grey
                              : Colors.black),
                    )
                  : Container(),
            );
          }).toList(),
        ),
      ),

      // FormField<LanguageType>(
      //   validator: (LanguageType? value) {
      //     if (value == null) {
      //       return "a language should be selected";
      //     } else
      //       return null;
      //   },
      //   autovalidateMode: AutovalidateMode.onUserInteraction,
      //   builder: (FormFieldState<LanguageType> state) {
      //     return Obx(
      //       () => InputDecorator(
      //         decoration: InputDecoration(
      //           errorStyle: TextStyle(color: Colors.redAccent, fontSize: 16.0),
      //           filled: true,
      //           fillColor: Colors.grey.shade200,
      //           errorBorder: OutlineInputBorder(
      //               borderRadius: BorderRadius.circular(5),
      //               borderSide: BorderSide(color: Colors.red)),
      //           enabledBorder: OutlineInputBorder(
      //               borderRadius: BorderRadius.circular(5),
      //               borderSide: BorderSide.none),
      //           focusedBorder: InputBorder.none,

      //           isDense: true,
      //           // contentPadding: EdgeInsets.all(5),
      //           label: Text("${_i18n()["none"]}"),
      //           floatingLabelBehavior: FloatingLabelBehavior.never,
      //           suffixIcon: (widget.showDeleteIcon &&
      //                   widget.languageValue.value != null)
      //               ? IconButton(
      //                   onPressed: () {
      //                     widget.languageValue.value = null;
      //                   },
      //                   icon: Icon(Icons.close))
      //               : null,
      //         ),
      //         isEmpty: widget.languageValue.value == null,
      //         child: DropdownButtonHideUnderline(
      //           child: DropdownButton<LanguageType>(
      //             value: widget.languageValue.value,
      //             isDense: true,
      //             dropdownColor: Colors.white,
      //             onChanged: (LanguageType? newValue) {
      //               if (newValue != null) {
      //                 final bool result =
      //                     widget.onChangeShouldUpdateLang(newValue);

      //                 if (result) {
      //                   widget.languageValue.value = newValue;
      //                   widget.languageValue.refresh();
      //                 }
      //               }
      //             },
      //             items: [
      //               LanguageType.EN,
      //               LanguageType.ES,
      //             ].map((LanguageType value) {
      //               return DropdownMenuItem<LanguageType>(
      //                 value: value,
      //                 enabled: (widget.oppositeLanguageValue != null &&
      //                     widget.oppositeLanguageValue!.value != value),
      //                 child: (value.toLanguageName() != null)
      //                     ? Text(
      //                         value.toLanguageName()!,
      //                         style: Get.textTheme.bodyText2?.copyWith(
      //                             fontWeight: FontWeight.w700,
      //                             color: (widget.oppositeLanguageValue !=
      //                                         null &&
      //                                     widget.oppositeLanguageValue!.value ==
      //                                         value)
      //                                 ? Colors.grey
      //                                 : Colors.black),
      //                       )
      //                     : Container(),
      //               );
      //             }).toList(),
      //           ),
      //         ),
      //       ),
      //     );
      //   },
      // ),
    );
  }
}
