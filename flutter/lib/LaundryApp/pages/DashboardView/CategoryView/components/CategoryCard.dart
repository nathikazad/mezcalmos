/*
* Created By Mirai Devs.
* On 4/11/2022.
*/
import 'package:flutter/material.dart';
import 'package:mezcalmos/Shared/constants/global.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    required this.title,
    required this.weight,
    required this.textTheme,
  }) : super(key: key);

  final TextTheme textTheme;
  final String title;
  final String weight;

  @override
  Widget build(BuildContext context) {
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
            title,
            style: textTheme.bodyText1,
          ),
          RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                  text: '$weight\$ ',
                  style: textTheme.bodyText1?.copyWith(
                    color: keyAppColor,
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
