import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/DeliveryAdminApp/controllers/laundryInfoController.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Generic.dart';
import 'package:mezcalmos/Shared/models/Services/Laundry.dart';

class LaundryOrderWeightSelector extends StatefulWidget {
  const LaundryOrderWeightSelector({
    Key? key,
    required String this.laundryId,
    required this.newCategory,
  }) : super(key: key);
  final Rxn<LaundryCostLineItem?> newCategory;
  final String laundryId;
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
    laundryInfoController.getLaundry(widget.laundryId).then((Laundry value) {
      value.laundryCosts.lineItems.forEach((LaundryCostLineItem element) {
        laundryCategories.add(element);
      });
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
                  errorStyle:
                      TextStyle(color: Colors.redAccent, fontSize: 16.0),
                  filled: true,
                  fillColor: Colors.white,
                  isDense: true,
                  label: Text("None"),
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  suffixIcon: (widget.newCategory.value != null)
                      ? IconButton(
                          onPressed: () {
                            widget.newCategory.value = null;
                          },
                          icon: Icon(Icons.close))
                      : null,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0))),
              isEmpty: widget.newCategory.value == null,
              child: DropdownButtonHideUnderline(
                child: DropdownButton<LaundryCostLineItem>(
                  value: widget.newCategory.value,
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(value.name[userLanguage] ??
                                "Error catgeory name"),
                            SizedBox(
                              width: 20,
                            ),
                            if (value.cost > 0)
                              Text(
                                " \$ ${value.cost} / KG",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(color: keyAppColor),
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
