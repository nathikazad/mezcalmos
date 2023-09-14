import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:mezcalmos/DeliveryApp/pages/DvConvoView/controllers/DvConvoViewController.dart';
import 'package:mezcalmos/DeliveryApp/pages/OrdersList/controllers/DriverCurrentOrdersController.dart';
import 'package:mezcalmos/DeliveryApp/router.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/helpers/DateTimeHelper.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/widgets/Chat/MezChatBubble.dart';
import 'package:mezcalmos/Shared/widgets/MezAppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';
import 'package:mezcalmos/Shared/widgets/MezCard.dart';

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
  void dispose() {
    viewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MezcalmosAppBar(AppBarLeftButtonType.Back,
          onClick: MezRouter.back,
          titleWidget: Obx(() => Text(viewController.title ?? ""))),
      bottomNavigationBar: Obx(
        () => !viewController.isFinished
            ? MezButton(
                label: viewController.showAcceptBtn
                    ? "Accept Order"
                    : "Finish order",
                borderRadius: 0,
                backgroundColor: viewController.showAcceptBtn
                    ? Colors.green
                    : primaryBlueColor,
                onClick: () async {
                  await viewController.handleClick();
                },
              )
            : SizedBox(),
      ),
      body: Obx(
        () => Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: viewController.dvMessages.length,
                  padding: const EdgeInsets.all(16),
                  itemBuilder: (BuildContext context, int index) {
                    final DeliveryMessage message =
                        viewController.dvMessages[index];

                    if (index == 0 ||
                        !isSameDay(
                            viewController.dvMessages[index - 1].receivedTime,
                            message.receivedTime)) {
                      return Column(
                        children: [
                          _buildDateTitle(message.receivedTime),
                          MezChatBubble(
                            message: message.entry.text.body,
                            timestamp: message.receivedTime,
                            imageUrl: message.userImage,
                          ),
                          if (message.isResponded)
                            MezCard(
                                margin: const EdgeInsets.only(top: 15),
                                firstAvatarBgImage: CachedNetworkImageProvider(
                                    viewController.driverImage),
                                content: Text(
                                    "${viewController.driverName} responded at ${message.respondedTime!.getOrderTime()}",
                                    style: context.textTheme.bodyLarge))
                        ],
                      );
                    } else {
                      return Column(
                        children: [
                          MezChatBubble(
                            message: message.entry.text.body,
                            timestamp: message.receivedTime,
                            imageUrl: message.userImage,
                          ),
                          if (message.isResponded)
                            MezCard(
                                margin: const EdgeInsets.only(top: 15),
                                firstAvatarBgImage: CachedNetworkImageProvider(
                                    viewController.driverImage),
                                content: Text(
                                    "${viewController.driverName} responded at ${message.respondedTime!.getOrderTime()}",
                                    style: context.textTheme.bodyLarge))
                        ],
                      );
                    }
                  }),
            ),
            smallSepartor,
            if (viewController.isResponded)
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                child: MezButton(
                  width: double.infinity,
                  borderRadius: 20,
                  elevation: 0.7,
                  height: 50,
                  label: "Open Whatsapp",
                  icon: Ionicons.logo_whatsapp,
                  onClick: () async {
                    await callWhatsappNumber(viewController.phoneNumber);
                  },
                  backgroundColor: Colors.white,
                  textColor: Colors.green,
                ),
              ),
            if (!viewController.isFinished)
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                child: MezButton(
                  label: "Cancel order",
                  borderRadius: 20,
                  height: 50,
                  onClick: () async {},
                  backgroundColor: offRedColor,
                  textColor: redAccentColor,
                ),
              ),
            smallSepartor,
          ],
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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(dateTime.getOrderTime(),
          style: context.textTheme.bodyMedium
              ?.copyWith(color: Colors.grey.shade700)),
    );
  }
}
