import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/models/CourierItem.dart';
import 'package:mezcalmos/CustomerApp/pages/DeliveryServices/Courrier/CustRequestCourrierView/controller/CustRequestCourierViewController.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/ContextHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/helpers/ResponsiveHelper.dart';
import 'package:mezcalmos/Shared/widgets/MezAddButton.dart';
import 'package:mezcalmos/Shared/widgets/MezIconButton.dart';
import 'package:sizer/sizer.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["CustomerApp"]
    ["pages"]["courrier"]["CustRequestCourierView"]["CustRequestCourierItems"];

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
                      item: viewController.items[index],
                      index: index,
                      context: context)),
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

  Widget _buildItem(
      {required CourierItem item,
      required int index,
      required BuildContext context}) {
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
                  '${_i18n()["item"]} ${index + 1}',
                  style:
                      context.txt.bodyLarge?.copyWith(color: primaryBlueColor),
                ),
                if (index != 0)
                  InkWell(
                    onTap: () {
                      viewController.removeItem(index);
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.delete_outline_rounded,
                          color: redAccentColor,
                        ),
                        Text(
                          '${_i18n()["remove"]}',
                          style: context.txt.bodyLarge?.copyWith(
                              color: redAccentColor, fontSize: 11.mezSp),
                        )
                      ],
                    ),
                  ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              '${_i18n()["whatCanWeGetYou"]}',
              style: context.txt.bodyMedium?.copyWith(),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Flexible(
                  fit: FlexFit.tight,
                  child: _textInput(
                      hint: '${_i18n()["name"]}',
                      context: context,
                      validator: (String? p0) {
                        if (p0 == null || p0.isEmpty) {
                          return '${_i18n()["required"]}';
                        }
                        return null;
                      },
                      controller: viewController.itemsNames[index]),
                ),
                SizedBox(
                  width: 5,
                ),
                Obx(
                  () => InkWell(
                    onTap: () async {
                      if (viewController.imagesFiles[index].path.isEmpty) {
                        await viewController.addItemImage(
                            itemIndex: index, context: context);
                      } else {
                        viewController.removeItemImage(index);
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          image: (viewController
                                  .imagesFiles[index].path.isNotEmpty)
                              ? DecorationImage(
                                  fit: BoxFit.cover,
                                  image: FileImage(
                                      viewController.imagesFiles[index]))
                              : null),
                      width: 49,
                      height: 49,
                      child: (viewController.imagesFiles[index].path.isNotEmpty)
                          ? Align(
                              alignment: Alignment.topRight,
                              child: Icon(Icons.cancel_rounded,
                                  color: offLightShadeGreyColor, size: 12.5.sp),
                            )
                          : Center(
                              child: (viewController.imagesLoading
                                      .contains(index))
                                  ? CircularProgressIndicator()
                                  : Icon(Icons.add_photo_alternate_outlined),
                            ),
                    ),
                  ),
                )
                // MezIconButton(
                //   icon: Icons.image,
                //   iconColor: Colors.black,
                //   padding: const EdgeInsets.all(12),
                //   backgroundColor: Colors.white,
                //   shape: BoxShape.rectangle,
                //   borderRadius: BorderRadius.circular(5),
                //   onTap: () {},
                // )
              ],
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        _textInput(
            hint: '${_i18n()["notes"]}',
            controller: viewController.itemsNotes[index],
            context: context),
        SizedBox(
          height: 10,
        ),
        _textInput(
            isPrice: true,
            hint: '${_i18n()["estimatedCost"]}',
            context: context,
            suffix: Icons.attach_money,
            controller: viewController.itemsEstCosts[index]),
      ],
    );
  }

  Widget _textInput(
      {required String hint,
      required TextEditingController controller,
      TextStyle? textStyle,
      required BuildContext context,
      IconData? suffix,
      bool isPrice = false,
      String? Function(String?)? validator}) {
    return TextFormField(
        scrollPadding: EdgeInsets.only(bottom: 100),
        controller: controller,
        validator: validator,
        keyboardType:
            (isPrice) ? TextInputType.numberWithOptions(decimal: true) : null,
        inputFormatters: (isPrice)
            ? [
                FilteringTextInputFormatter.allow(RegExp('[0-9.,]')),
              ]
            : [],
        style: textStyle ?? context.txt.bodyLarge,
        decoration: InputDecoration(
            fillColor: Colors.white,
            hintText: hint,
            suffixIconColor: Colors.grey.shade600,
            suffixIcon: (suffix != null)
                ? Icon(
                    suffix,
                    color: Colors.black,
                  )
                : null));
  }
}
