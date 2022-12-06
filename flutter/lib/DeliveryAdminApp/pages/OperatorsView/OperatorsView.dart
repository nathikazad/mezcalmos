import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/DeliveryAdminApp/pages/OperatorsView/Components/RestaurantOpCard.dart';
import 'package:mezcalmos/DeliveryAdminApp/pages/OperatorsView/Controllers/OperatorsViewController.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezAddButton.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';
import 'package:sizer/sizer.dart';

class OperatorsView extends StatefulWidget {
  const OperatorsView({super.key});

  @override
  State<OperatorsView> createState() => _OperatorsViewState();
}

class _OperatorsViewState extends State<OperatorsView> {
  OperatorsViewController viewController = OperatorsViewController();

  String? restID;
  @override
  void initState() {
    restID = Get.parameters["restaurantId"];
    if (restID != null) {
      viewController.init(restaurantId: restID!);
    } else {
      Get.back();
    }
    super.initState();
  }

  @override
  void dispose() {
    viewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mezcalmosAppBar(AppBarLeftButtonType.Back, onClick: Get.back,
          titleWidget: Obx(
        () {
          if (viewController.restaurant.value != null) {
            return Text("${viewController.restaurant.value!.info.name}");
          } else
            return SizedBox();
        },
      )),
      body: Obx(() {
        if (viewController.restaurant.value != null) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MezAddButton(onClick: () {
                  _addOpSheet();
                }),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  child: Text(
                    "Operators ",
                    style: Get.textTheme.bodyText1,
                  ),
                ),
                Column(
                  children: List.generate(
                      viewController.ops.length,
                      (int index) => RestaurantOperatorCard(
                          viewController: viewController,
                          op: viewController.ops[index])),
                )
              ],
            ),
          );
        } else {
          return Container(
            alignment: Alignment.center,
            // child: MezLogoAnimation(),
          );
        }
      }),
    );
  }

  Future<void> _addOpSheet() {
    return showModalBottomSheet(
        isScrollControlled: true,
        context: Get.context!,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        )),
        builder: (BuildContext ctx) {
          return Padding(
            padding:
                EdgeInsets.only(bottom: MediaQuery.of(ctx).viewInsets.bottom),
            child: Container(
                margin: const EdgeInsets.only(
                  top: 16,
                  left: 12,
                  right: 12,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 5, bottom: 8),
                      alignment: Alignment.center,
                      child: Text(
                        'New operator',
                        style:
                            Get.textTheme.headline3?.copyWith(fontSize: 17.sp),
                      ),
                    ),
                    Divider(),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Phone or email",
                      style: Get.textTheme.bodyText1,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      controller: viewController.emailOrPhone,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Flexible(
                            child: MezButton(
                          label: "Cancel",
                          backgroundColor: offRedColor,
                          textColor: Colors.red,
                          onClick: () async {
                            Get.back();
                          },
                        )),
                        const SizedBox(
                          width: 8,
                        ),
                        Flexible(
                            child: MezButton(
                          label: "Add operator",
                          withGradient: true,
                          onClick: () async {
                            final bool result =
                                await viewController.addOperator();
                            if (result) Get.back();
                          },
                        )),
                      ],
                    ),
                    if (MediaQuery.of(ctx).viewInsets.bottom == 0)
                      const SizedBox(
                        height: 25,
                      ),
                  ],
                )),
          );
        });
  }
}
