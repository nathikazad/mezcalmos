import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';

class LaundryOpEditInfoView extends StatelessWidget {
  const LaundryOpEditInfoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mezcalmosAppBar(AppBarLeftButtonType.Back, onClick: Get.back),
      body: ListView(),
      bottomNavigationBar: Container(
        height: 45,
        child: TextButton(
            style: TextButton.styleFrom(shape: RoundedRectangleBorder()),
            onPressed: () {},
            child: Container(
                alignment: Alignment.center, child: Text('Save info'))),
      ),
    );
  }
}
