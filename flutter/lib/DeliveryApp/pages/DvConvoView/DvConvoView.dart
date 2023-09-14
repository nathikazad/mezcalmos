import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/DeliveryApp/pages/DvConvoView/controllers/DvConvoViewController.dart';
import 'package:mezcalmos/DeliveryApp/pages/OrdersList/controllers/DriverCurrentOrdersController.dart';
import 'package:mezcalmos/DeliveryApp/router.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/helpers/DateTimeHelper.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/widgets/Chat/MezChatBubble.dart';
import 'package:mezcalmos/Shared/widgets/MezAppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';

class DvConvoView extends StatefulWidget {
  const DvConvoView({super.key});
  static Future<void> navigate({required String phoneNumber}) async {
    final String route = DeliveryAppRoutes.kDriverConvoRoute
        .replaceFirst(":phoneNumber", "$phoneNumber");
    return MezRouter.toPath(route);
  }

  @override
  State<DvConvoView> createState() => _DvConvoViewState();
}

class _DvConvoViewState extends State<DvConvoView> {
  DvConvoViewController viewController = DvConvoViewController();
  @override
  void initState() {
    String? phoneNumber =
        MezRouter.urlArguments["phoneNumber"]?.value.toString();
    if (phoneNumber != null) {
      viewController.init(phoneNumber: phoneNumber);
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MezcalmosAppBar(AppBarLeftButtonType.Back,
          onClick: MezRouter.back,
          titleWidget: Obx(() => Text(viewController.title ?? ""))),
      bottomNavigationBar: MezButton(
        label: viewController.showAcceptBtn ? "Accept Order" : "Finish order",
        borderRadius: 0,
        backgroundColor:
            viewController.showAcceptBtn ? Colors.green : primaryBlueColor,
        onClick: () async {},
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Obx(
          () => Column(
            children: [
              ListView.builder(
                  itemCount: viewController.dvMessages.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    final DeliveryMessage message =
                        viewController.dvMessages[index];

                    // Check if this is the first message or the date has changed
                    if (index == 0 ||
                        !isSameDay(
                            viewController.dvMessages[index - 1].receivedTime,
                            message.receivedTime)) {
                      // Display the date as a title
                      return Column(
                        children: [
                          _buildDateTitle(message.receivedTime),
                          MezChatBubble(
                            message: message.entry.text.body,
                            timestamp: message.receivedTime,
                            imageUrl: message.userImage,
                          ),
                        ],
                      );
                    } else {
                      // Just display the message
                      return MezChatBubble(
                        message: message.entry.text.body,
                        timestamp: message.receivedTime,
                        imageUrl: message.userImage,
                      );
                    }
                  }),
              if (!viewController.showAcceptBtn)
                Container(
                  margin: const EdgeInsets.all(12),
                  child: MezButton(
                    label: "Cancel order",
                    onClick: () async {},
                    backgroundColor: offRedColor,
                    textColor: redAccentColor,
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }

  bool isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }

  Widget _buildDateTitle(DateTime dateTime) {
    // Format the date as desired (e.g., "12 September 2023")

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(dateTime.getOrderTime(),
          style: context.textTheme.bodyMedium
              ?.copyWith(color: Colors.grey.shade700)),
    );
  }
}
