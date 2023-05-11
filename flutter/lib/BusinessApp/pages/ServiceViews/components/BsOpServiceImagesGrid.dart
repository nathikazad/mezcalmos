import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/BusinessApp/pages/ServiceViews/controllers/BusinessDetailsController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';

dynamic _i18n() =>
    Get.find<LanguageController>().strings['BusinessApp']['pages']['services'];

class BsOpServiceImagesGrid extends StatelessWidget {
  final BusinessItemDetailsController detailsController;
  const BsOpServiceImagesGrid({super.key, required this.detailsController});

  @override
  Widget build(BuildContext context) {
    return FormField(validator: (Object? v) {
      mezDbgPrint("images validator called");
      if (!detailsController.hasOneImage) {
        return _i18n()["imageError"];
      }
      return null;
    }, builder: (FormFieldState<Object?> state) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Obx(
            () => Wrap(
                spacing: 8,
                runSpacing: 5,
                children: List.generate(
                  5,
                  (int index) {
                    bool hasImage = detailsController.getImage(index) != null;

                    return InkWell(
                      onTap: () {
                        detailsController.addItemImage(
                            itemIndex: index, context: context);
                      },
                      borderRadius: BorderRadius.circular(10),
                      child: Ink(
                        width: 70,
                        height: 70,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(10),
                          image: hasImage
                              ? DecorationImage(
                                  image: detailsController.getImage(index)!,
                                  fit: BoxFit.cover,
                                )
                              : null,
                        ),
                        child: hasImage == false
                            ? Icon(
                                Icons.add_photo_alternate,
                                color: Colors.grey,
                                size: 35,
                              )
                            : Container(),
                      ),
                    );
                  },
                )),
          ),
          Container(
            padding: const EdgeInsets.only(top: 5, left: 12),
            child: Text(state.errorText ?? "",
                style: context.theme.inputDecorationTheme.errorStyle),
          ),
        ],
      );
    });
  }
}
