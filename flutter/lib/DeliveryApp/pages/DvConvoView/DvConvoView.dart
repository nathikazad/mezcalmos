import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ionicons/ionicons.dart';
import 'package:mezcalmos/DeliveryApp/pages/DvConvoView/controllers/DvConvoViewController.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/models/Drivers/DeliveryMessage.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/routes/SharedDeliveryRoutes.dart';
import 'package:mezcalmos/Shared/widgets/Chat/MezChatBubble.dart';
import 'package:mezcalmos/Shared/widgets/MezAppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["DeliveryApp"]
    ["pages"]["DvConvoView"];

class DvConvoView extends StatefulWidget {
  const DvConvoView({super.key});
  static Future<void> navigate({required String phoneNumber}) async {
    final String route = SharedDvRoutes.kDriverConvoRoute
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
    final String? phoneNumber =
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
                    ? _i18n()['respond']
                    : _i18n()['finish'],
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
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                  controller: viewController.scrollController,
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
                        children: <Widget>[
                          _buildDateTitle(message.receivedTime),
                          MezChatBubble(
                            message: message.entry.text?.body ?? '',
                            timestamp: message.receivedTime,
                            imageUrl: message.userImage,
                          ),
                          if (message.isResponded)
                            _driverResponded(context, message)
                        ],
                      );
                    } else {
                      return Column(
                        children: <Widget>[
                          MezChatBubble(
                            message: message.entry.text?.body ?? '',
                            timestamp: message.receivedTime,
                            imageUrl: message.userImage,
                          ),
                          if (message.isResponded)
                            _driverResponded(context, message)
                        ],
                      );
                    }
                  }),
            ),
            smallSepartor,
            Container(
              margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
              child: Row(
                children: <Widget>[
                  if (viewController.isResponded)
                    Flexible(
                      child: MezButton(
                        width: double.infinity,
                        borderRadius: 15,
                        elevation: 0.7,
                        height: 40,
                        label: _i18n()['whatsapp'],
                        icon: Ionicons.logo_whatsapp,
                        onClick: () async {
                          await callWhatsappNumber(viewController.phoneNumber);
                        },
                        textColor: Colors.white,
                        backgroundColor: Colors.green,
                      ),
                    ),
                  if (viewController.isResponded &&
                      !viewController.isFinished &&
                      !viewController.showAcceptBtn)
                    hSmallSepartor,
                  if (!viewController.isFinished &&
                      !viewController.showAcceptBtn)
                    Flexible(
                      child: MezButton(
                        label: _i18n()['cancel'],
                        borderRadius: 15,
                        height: 40,
                        onClick: () async {
                          await viewController.cancelOrder();
                        },
                        border: BorderSide(width: 1, color: redAccentColor),
                        backgroundColor: Colors.white,
                        textColor: redAccentColor,
                      ),
                    ),
                ],
              ),
            ),
            smallSepartor,
          ],
        ),
      ),
    );
  }

  Widget _driverResponded(BuildContext context, DeliveryMessage message) {
    if (message.showDriverInfo && message.driverName != null)
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        child: Text.rich(TextSpan(children: <InlineSpan>[
          WidgetSpan(
            child: InkWell(
              onTap: () {
                if (message.driverPhone != null) {
                  callWhatsappNumber(message.driverPhone!);
                }
              },
              child: Ink(
                child: Text(
                  "${message.driverName}",
                  style: context.textTheme.bodyMedium?.copyWith(
                      color: primaryBlueColor,
                      decoration: TextDecoration.underline),
                ),
              ),
            ),
          ),
          WidgetSpan(child: hTinySepartor),
          TextSpan(
              text:
                  "${_i18n()['respondedAt']} ${DateFormat("hh:mm a").format(message.respondedTime!)}"),
        ])),
      );
    return Container();
  }

  bool isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }

  Widget _buildDateTitle(DateTime dateTime) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(DateFormat("dd-MM-yyyy").format(dateTime),
          style: context.textTheme.bodyMedium
              ?.copyWith(color: Colors.grey.shade700)),
    );
  }
}
