import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/BusinessApp/pages/ServiceViews/BsHomeRentalView/controllers/BsHomeRentalViewController.dart';
import 'package:mezcalmos/BusinessApp/pages/ServiceViews/components/BsOpTimeUnitSelectorSheet.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/widgets/MezIconButton.dart';

class BsOpOfferingPricesList extends StatelessWidget {
  const BsOpOfferingPricesList(
      {super.key,
      required this.availbleUnits,
      required this.onAddPrice,
      required this.onRemovePrice, // <--- this is the function that is called when the user clicks on the remove button
      required this.seletedPrices});
  final OfferingPricesMap seletedPrices;
  final List<TimeUnit> availbleUnits;
  final Function(TimeUnit) onAddPrice;
  final Function(TimeUnit) onRemovePrice;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Flexible(
              fit: FlexFit.tight,
              child: Text(
                "Prices",
                style: context.textTheme.bodyLarge,
              ),
            ),
            if (availbleUnits.isNotEmpty)
              InkWell(
                  onTap: () async {
                    TimeUnit? newUnit = await bsOpTimeUnitSelectorSheet(
                        context: context, units: availbleUnits);
                    mezDbgPrint("newUnit: $newUnit");
                    if (newUnit != null) {
                      onAddPrice(newUnit);
                    }
                  },
                  child: Ink(
                    padding: const EdgeInsets.all(5),
                    child: Row(
                      children: [
                        Icon(
                          Icons.add_circle_outline,
                          size: 20,
                          color: primaryBlueColor,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          "Add price",
                          style: context.textTheme.bodyLarge
                              ?.copyWith(color: primaryBlueColor),
                        ),
                      ],
                    ),
                  )),
          ],
        ),
        smallSepartor,
        Obx(
          () => Column(
              children: List.generate(seletedPrices.length, (int index) {
            final TimeUnit timeUnit = seletedPrices.entries.toList()[index].key;
            final TextEditingController textEditingController =
                seletedPrices.entries.toList()[index].value;
            return singlePriceCard(
              textEditingController: textEditingController,
              timeUnit: timeUnit,
              canRemove: seletedPrices.entries.length > 1,
              context: context,
              onRemoveTimeUnit: () {
                onRemovePrice(timeUnit);
              },
            );
          })),
        ),
      ],
    );
  }

  Widget singlePriceCard(
      {required TextEditingController textEditingController,
      required TimeUnit timeUnit,
      required BuildContext context,
      required bool canRemove,
      required void Function() onRemoveTimeUnit}) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Row(
        children: [
          Flexible(
            flex: 2,
            child: TextFormField(
              style: context.textTheme.bodyLarge,
              decoration: InputDecoration(
                hintText: "Price",
                suffixIconConstraints: BoxConstraints(
                  minWidth: 0,
                  minHeight: 0,
                ).tighten(width: 80),
                prefixIcon: const Icon(Icons.attach_money),
                suffixIcon: Text(
                  "${timeUnit.toFirebaseFormatString()}",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
              controller: textEditingController,
            ),
          ),
          if (canRemove)
            Padding(
              padding: const EdgeInsets.only(left: 6),
              child: MezIconButton(
                onTap: onRemoveTimeUnit,
                iconSize: 20,
                backgroundColor: Colors.transparent,
                iconColor: Colors.redAccent,
                icon: Icons.delete_outline,
              ),
            ),
        ],
      ),
    );
  }
}
