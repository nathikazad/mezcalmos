import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/helpers/ContextHelper.dart';

class ROpNumberSelector extends StatelessWidget {
  const ROpNumberSelector({Key? key, required this.value}) : super(key: key);
  final RxnInt value;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => DropdownButtonFormField<int>(
        // isDense: true,
        // isExpanded: false,
        decoration: InputDecoration(
          filled: true,
          isDense: true,
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
          floatingLabelBehavior: FloatingLabelBehavior.never,
        ),
        value: value.value,
        onChanged: (int? newValue) {
          if (newValue != null) {
            value.value = newValue;
          }
        },
        validator: (int? value) {
          if (value == null) {
            return "Required";
          } else {
            return null;
          }
        },
        items: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
            .map<DropdownMenuItem<int>>((int value) {
          return DropdownMenuItem<int>(
            value: value,
            child: (value.toString() != null)
                ? Text(
                    value.toString(),
                    style: context.txt.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  )
                : Container(),
          );
        }).toList(),
      ),
    );
  }
}
