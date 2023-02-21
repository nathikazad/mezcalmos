import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/models/CourierItem.dart';
import 'package:mezcalmos/CustomerApp/pages/Courrier/CustRequestCourrierView/controller/CustRequestCourierViewController.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/widgets/MezAddButton.dart';
import 'package:mezcalmos/Shared/widgets/MezIconButton.dart';

class CustRequestCourierItems extends StatelessWidget {
  const CustRequestCourierItems({super.key, required this.viewController});
  final CustRequestCourierViewController viewController;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Obx(
            () => Column(
              children: List.generate(
                  viewController.items.length,
                  (int index) => _buildItem(
                      item: viewController.items[index], index: index)),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          MezAddButton(
              btnHeight: 50,
              onClick: () {
                viewController.addNewEmptyItem();
              }),
        ],
      ),
    );
  }

  Widget _buildItem({required CourierItem item, required int index}) {
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Item ${index + 1}",
                  style: Get.textTheme.bodyLarge
                      ?.copyWith(color: primaryBlueColor),
                ),
                if (index != 0)
                  MezIconButton(
                      onTap: () {
                        viewController.removeItem(index);
                      },
                      iconSize: 18,
                      backgroundColor: offRedColor,
                      iconColor: Colors.red,
                      icon: Icons.close)
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "What can we get you?",
              style: Get.textTheme.bodyMedium?.copyWith(),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Flexible(
                  fit: FlexFit.tight,
                  child: _textInput(
                      hint: "Name",
                      validator: (String? p0) {
                        if (p0 == null || p0.isEmpty) {
                          return "Required";
                        }
                        return null;
                      },
                      controller: viewController.itemsNames[index]),
                ),
                SizedBox(
                  width: 5,
                ),
                MezIconButton(
                  icon: Icons.image,
                  iconColor: Colors.black,
                  padding: const EdgeInsets.all(12),
                  backgroundColor: Colors.white,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(5),
                  onTap: () {},
                )
              ],
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        _textInput(hint: "Notes", controller: viewController.itemsNotes[index]),
        SizedBox(
          height: 10,
        ),
        _textInput(
            hint: "Estimated cost",
            suffix: Icons.attach_money,
            validator: (String? p0) {
              if (p0 == null || p0.isEmpty) {
                return "Required";
              }
              return null;
            },
            controller: viewController.itemsEstCosts[index]),
      ],
    );
  }

  Widget _textInput(
      {required String hint,
      required TextEditingController controller,
      IconData? suffix,
      bool isPrice = false,
      String? Function(String?)? validator}) {
    return TextFormField(
        controller: controller,
        validator: validator,
        keyboardType:
            (isPrice) ? TextInputType.numberWithOptions(decimal: true) : null,
        inputFormatters: (isPrice)
            ? [
                FilteringTextInputFormatter.allow(RegExp('[0-9.,]')),
              ]
            : [],
        style: Get.textTheme.bodyLarge,
        decoration: InputDecoration(
            fillColor: Colors.white,
            hintText: hint,
            suffixIconColor: Colors.grey.shade600,
            suffixIcon: (suffix != null) ? Icon(suffix) : null));
  }
}
