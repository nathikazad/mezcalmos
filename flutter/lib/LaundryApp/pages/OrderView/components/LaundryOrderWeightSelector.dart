import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/LaundryApp/controllers/laundryInfoController.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Generic.dart';
import 'package:mezcalmos/Shared/models/Services/Laundry.dart';
import 'package:sizer/sizer.dart';

class LaundryOrderWeightSelector extends StatefulWidget {
  const LaundryOrderWeightSelector({
    Key? key,
    required this.newCategory,
  }) : super(key: key);
  final Rxn<LaundryCostLineItem?> newCategory;

  @override
  State<LaundryOrderWeightSelector> createState() =>
      _LaundryOrderWeightSelectorState();
}

class _LaundryOrderWeightSelectorState
    extends State<LaundryOrderWeightSelector> {
  final LanguageType userLanguage =
      Get.find<LanguageController>().userLanguageKey;

  LaundryInfoController laundryInfoController =
      Get.find<LaundryInfoController>();
  RxList<LaundryCostLineItem> laundryCategories = RxList.empty();

  @override
  void initState() {
    laundryInfoController.laundry.value!.laundryCosts.lineItems
        .forEach((LaundryCostLineItem element) {
      laundryCategories.add(element);
    });

    super.initState();
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
              isEmpty: widget.newCategory.value == null,
              child: DropdownButtonHideUnderline(
                child: DropdownButton<LaundryCostLineItem>(
                  value: widget.newCategory.value,
                  isExpanded: true,
                  isDense: true,
                  onChanged: (LaundryCostLineItem? newValue) {
                    if (newValue != null) {
                      setCategory(newValue);
                    }
                  },
                  items: laundryCategories.map((LaundryCostLineItem value) {
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
                                style: Get.textTheme.bodyText1
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
                                    .bodyText1!
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

  void setCategory(LaundryCostLineItem category) {
    widget.newCategory.value = category;
  }
}
