import 'package:flutter/material.dart';
import 'package:mezcalmos/DeliveryApp/pages/DvConvoView/controllers/DvConvoViewController.dart';
import 'package:mezcalmos/DeliveryApp/pages/OrdersList/controllers/DriverCurrentOrdersController.dart';
import 'package:mezcalmos/DeliveryApp/router.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/helpers/DateTimeHelper.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/widgets/MezAppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';
import 'package:mezcalmos/Shared/widgets/MezCard.dart';

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
          onClick: () {}, title: viewController.convo.first.from),
      bottomNavigationBar: viewController.showAcceptBtn
          ? MezButton(
              label: "Accept Order",
              borderRadius: 0,
              onClick: () async {},
            )
          : SizedBox(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Column(
              children: List.generate(
                viewController.convo.length,
                (int index) {
                  final WhMessage message = viewController.convo[index];
                  return MezCard(
                    content: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(message.text.body.toString()),
                        smallSepartor,
                        Divider(
                          height: 5,
                          thickness: 0.3,
                        ),
                        Container(
                          alignment: Alignment.bottomRight,
                          child: Text.rich(
                            TextSpan(
                              children: [
                                WidgetSpan(
                                  child: Icon(
                                    Icons.watch_later_outlined,
                                    size: 15.0,
                                  ),
                                ),
                                WidgetSpan(child: hTinySepartor),
                                TextSpan(
                                    text: message.timestamp.getEstimatedTime()),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
