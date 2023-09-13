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
  static Future<void> navigate({required List<WhMessage> convo}) async {
    return MezRouter.toPath(DeliveryAppRoutes.kDriverConvoRoute,
        arguments: {"convo": convo});
  }

  @override
  State<DvConvoView> createState() => _DvConvoViewState();
}

class _DvConvoViewState extends State<DvConvoView> {
  DvConvoViewController viewController = DvConvoViewController();
  @override
  void initState() {
    List<WhMessage>? messages =
        MezRouter.bodyArguments?["convo"] as List<WhMessage>?;
    if (messages != null) {
      viewController.init(messages: messages);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MezcalmosAppBar(AppBarLeftButtonType.Back,
          onClick: MezRouter.back, title: viewController.convo.first.from),
      bottomNavigationBar: MezButton(
        label: viewController.showAcceptBtn ? "Accept Order" : "Finish order",
        borderRadius: 0,
        backgroundColor:
            viewController.showAcceptBtn ? Colors.green : primaryBlueColor,
        onClick: () async {},
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            ListView.builder(
                itemCount: viewController.convo.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  final WhMessage message = viewController.convo[index];

                  // Check if this is the first message or the date has changed
                  if (index == 0 ||
                      !isSameDay(viewController.convo[index - 1].timestamp,
                          message.timestamp)) {
                    // Display the date as a title
                    return Column(
                      children: [
                        _buildDateTitle(message.timestamp),
                        MezChatBubble(
                          message: message.text.body,
                          timestamp: message.timestamp,
                        ),
                      ],
                    );
                  } else {
                    // Just display the message
                    return MezChatBubble(
                      message: message.text.body,
                      timestamp: message.timestamp,
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
