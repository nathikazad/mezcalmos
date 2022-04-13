/*
* Created By Mirai Devs.
* On 4/11/2022.
*/
import 'package:flutter/material.dart';
import 'package:mezcalmos/Shared/models/Generic.dart';
import 'package:mezcalmos/Shared/models/Services/Laundry.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    required this.laundryCostLineItem,
  }) : super(key: key);

  final LaundryCostLineItem laundryCostLineItem;
  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 11),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            laundryCostLineItem.name[LanguageType.EN] ?? "null",
            style: textTheme.bodyText1,
          ),
          RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                  text: '${laundryCostLineItem.cost}\$ ',
                  style: textTheme.bodyText1?.copyWith(
                    color: Theme.of(context).primaryColorLight,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextSpan(
                  text: ' /kg',
                  style: textTheme.bodyText2?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
