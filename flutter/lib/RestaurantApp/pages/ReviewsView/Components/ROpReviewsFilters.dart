import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/RestaurantApp/pages/ReviewsView/Controllers/ROpReviewsViewController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';

//
dynamic _i18n() => Get.find<LanguageController>().strings["RestaurantApp"]
    ["pages"]["ROpReviewsView"];

//
class ROpReviewsFilters extends StatelessWidget {
  const ROpReviewsFilters({
    Key? key,
    required this.viewController,
  }) : super(key: key);

  final ROpReviewsViewController viewController;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: List.generate(
                viewController.filters.length,
                (int index) => FilterChip(
                    selected: viewController.filterBy.value ==
                        viewController.filters[index],
                    label: Text(
                        '${_i18n()[viewController.filters[index].toNormalString().toLowerCase()]}'
                            .inCaps),
                    labelStyle: TextStyle(
                        fontWeight: (viewController.filterBy.value ==
                                viewController.filters[index])
                            ? FontWeight.w600
                            : null),
                    onSelected: (bool v) {
                      viewController
                          .switchFiletrBy(viewController.filters[index]);
                    }))),
      ),
    );
  }
}
