import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/constants/global.dart';

class CustCircularLoader extends StatelessWidget {
  const CustCircularLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(),
          SizedBox(
            height: 15,
          ),
          Text(
            "Loading...",
            style: context.theme.textTheme.bodyMedium
                ?.copyWith(color: primaryBlueColor),
          ),
          SizedBox(
            height: 5,
          ),
          // InkWell(
          //   onTap: () {
          //     MezRouter.back();
          //   },
          //   child: Ink(
          //       padding: const EdgeInsets.all(8), child: Text("Back")),
          // )
        ],
      ),
    );
  }
}
