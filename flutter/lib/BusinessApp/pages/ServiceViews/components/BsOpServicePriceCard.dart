import 'package:flutter/material.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/widgets/MezIconButton.dart';

class BsOpServicePriceCard extends StatelessWidget {
  final TextEditingController textEditingController;
  final TimeUnit timeUnit;
  final void Function() onRemoveTimeUnit;

  const BsOpServicePriceCard({
    Key? key,
    required this.textEditingController,
    required this.timeUnit,
    required this.onRemoveTimeUnit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Row(
        children: [
          Flexible(
            flex: 2,
            child: TextFormField(
              style: Theme.of(context).textTheme.bodyLarge,
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
          const SizedBox(width: 8),
          MezIconButton(
            onTap: onRemoveTimeUnit,
            iconSize: 20,
            backgroundColor: Colors.transparent,
            iconColor: Colors.redAccent,
            icon: Icons.delete_outline,
          ),
        ],
      ),
    );
  }
}
