import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/helpers/ContextHelper.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';
import 'package:mezcalmos/Shared/models/Services/Laundry.dart';
import 'package:mezcalmos/Shared/pages/LaundryOrderView/controllers/LaundryOrderViewController.dart';
import 'package:sizer/sizer.dart';

class LaundryOrderWeightSelector extends StatefulWidget {
  const LaundryOrderWeightSelector({
    Key? key,
    required this.viewController,
  }) : super(key: key);
  final LaundryOrderViewController viewController;

  @override
  State<LaundryOrderWeightSelector> createState() =>
      _LaundryOrderWeightSelectorState();
}

class _LaundryOrderWeightSelectorState
    extends State<LaundryOrderWeightSelector> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FormField<LaundryCostLineItem>(
        builder: (FormFieldState<LaundryCostLineItem> state) {
          return Obx(
            () => InputDecorator(
              decoration: InputDecoration(
                errorStyle: TextStyle(color: Colors.redAccent, fontSize: 16.0),
                filled: true,
                fillColor: Colors.grey.shade200,
                isDense: true,
                label: Text("None"),
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(8)),
                floatingLabelBehavior: FloatingLabelBehavior.never,
              ),
              isEmpty: widget.viewController.selectedCategory.value == null,
              child: DropdownButtonHideUnderline(
                child: DropdownButton<LaundryCostLineItem>(
                  value: widget.viewController.selectedCategory.value,
                  isExpanded: true,
                  isDense: true,
                  onChanged: (LaundryCostLineItem? newValue) {
                    if (newValue != null) {
                      widget.viewController.setCategory(newValue);
                    }
                  },
                  items: widget.viewController.laundryCategories
                      .map((LaundryCostLineItem value) {
                    return DropdownMenuItem<LaundryCostLineItem>(
                      value: value,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Flexible(
                              flex: 3,
                              child: Text(
                                value.name[userLanguage] ??
                                    "Error catgeory name",
                                style: context.txt.bodyLarge
                                    ?.copyWith(fontSize: 11.sp),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            if (value.cost > 0)
                              Text(
                                " \$${value.cost}/KG",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(color: primaryBlueColor),
                              )
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

  // void setCategory(LaundryCostLineItem category) {
  //   widget.newCategory.value = category;
  // }
}
