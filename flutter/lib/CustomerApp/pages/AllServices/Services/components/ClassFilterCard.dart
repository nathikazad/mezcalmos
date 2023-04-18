import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/pages/AllServices/AllServiceListView/controllers/SubServiceController.dart';
import 'package:mezcalmos/CustomerApp/pages/AllServices/Services/ClassesService/controller/ClassesController.dart';
import 'package:mezcalmos/CustomerApp/pages/AllServices/Services/Rental/controller/OtherRentalController.dart';
import 'package:mezcalmos/CustomerApp/pages/AllServices/Services/controller/AssetController.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/widgets/MezCard.dart';
import 'package:mezcalmos/CustomerApp/pages/AllServices/AllServiceListView/controllers/AllServiceListViewController.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['CustomerApp']
    ['pages']['CustHomeWrapper'];

class ClassFilterCard extends StatefulWidget {
  const ClassFilterCard({super.key, required this.classesController});

  final ClassesController classesController;

  @override
  State<ClassFilterCard> createState() => _ClassFilterCardState();
}

class _ClassFilterCardState extends State<ClassFilterCard> {
  late ClassesController classesController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    classesController = widget.classesController;
  }

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: MezCard(
        onClick: () {
          openFilterModalSheet();
        },
        content: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.filter_alt,
            ),
            Text("Filter: "),
            Obx(
              () => Text(
                classesController.filterString.value,
                style: style.titleMedium!.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Icon(
                Icons.keyboard_arrow_down_outlined,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void openFilterModalSheet() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          final Map<EventCategory1, bool> category1 = {
            ...classesController.category1
          };
          final Map<ScheduleType, bool> scheduleType = {
            ...classesController.scheduleType
          };
          final style = Theme.of(context).textTheme;
          return DraggableScrollableSheet(
              initialChildSize: 0.4,
              minChildSize: 0.2,
              maxChildSize: 1,
              expand: false,
              builder: (context, controller) {
                return StatefulBuilder(builder: (context, setState) {
                  return Scaffold(
                    body: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: CustomScrollView(
                            controller: controller,
                            slivers: [
                              SliverToBoxAdapter(
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Text("Filter",
                                        style: style.titleMedium!.copyWith(
                                          fontWeight: FontWeight.w600,
                                        )),
                                  ),
                                ),
                              ),
                              SliverToBoxAdapter(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text(
                                    "Type",
                                    style: style.titleMedium!.copyWith(
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ),
                              SliverList(
                                delegate: SliverChildBuilderDelegate(
                                  (context, index) {
                                    return CheckboxListTile(
                                      activeColor: primaryBlueColor,
                                      onChanged: (value) {
                                        setState(() {
                                          scheduleType[scheduleType.keys
                                                  .toList()[index]] =
                                              value ?? false;
                                          mezDbgPrint(
                                              "CheckboxListTile: $value $scheduleType");
                                        });
                                      },
                                      value: scheduleType[
                                          scheduleType.keys.toList()[index]],
                                      title: Text(scheduleType.keys
                                          .toList()[index]
                                          .name),
                                    );
                                  },
                                  childCount: scheduleType.length,
                                ),
                              ),
                              SliverToBoxAdapter(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text(
                                    "Category",
                                    style: style.titleMedium!.copyWith(
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ),
                              SliverList(
                                delegate: SliverChildBuilderDelegate(
                                  (context, index) {
                                    return CheckboxListTile(
                                      activeColor: primaryBlueColor,
                                      onChanged: (value) {
                                        setState(() {
                                          category1[category1.keys
                                                  .toList()[index]] =
                                              value ?? false;
                                          mezDbgPrint(
                                              "CheckboxListTile: $value $category1");
                                        });
                                      },
                                      value: category1[
                                          category1.keys.toList()[index]],
                                      title: Text(
                                          category1.keys.toList()[index].name),
                                    );
                                  },
                                  childCount: category1.length,
                                ),
                              ),
                              SliverToBoxAdapter(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 4.0),
                                          child: MezButton(
                                            label: "Cancel",
                                            onClick: () async {
                                              Navigator.pop(context);
                                            },
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 4.0),
                                          child: MezButton(
                                            label: "Confirm",
                                            withGradient: true,
                                            onClick: () async {
                                              if (category1.values
                                                  .contains(true)) {
                                                classesController
                                                    .changeClassFilter(
                                                  scheduleTypeValue:
                                                      scheduleType,
                                                  category1Value: category1,
                                                );
                                                Navigator.pop(context);
                                              } else {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                        "Add atleast 1 filter"),
                                                  ),
                                                );
                                              }
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                });
              });
        });
  }
}
