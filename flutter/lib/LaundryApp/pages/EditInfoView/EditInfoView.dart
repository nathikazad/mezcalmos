import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';

class LaundryOpEditInfoView extends StatelessWidget {
  const LaundryOpEditInfoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mezcalmosAppBar(AppBarLeftButtonType.Back, onClick: Get.back),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          // image
          CircleAvatar(
              radius: 70,
              // backgroundImage: [avatarImage],
              child: Material(
                shape: CircleBorder(),
                clipBehavior: Clip.hardEdge,
                color: Colors.transparent,
                child: InkWell(
                  onTap: () => {},
                  child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.black.withOpacity(0.3)),
                      child: Icon(
                        Icons.edit,
                        color: Colors.white,
                      )),
                ),
              )),
          // Laundry name fiels
          SizedBox(
            height: 10,
          ),
          Text('Laundry name'),

          SizedBox(
            height: 5,
          ),
          TextFormField(
            decoration: InputDecoration(filled: true, fillColor: Colors.white),
          ),
          
        ],
      ),
      bottomNavigationBar: Container(
        height: 50,
        child: TextButton(
            style: TextButton.styleFrom(shape: RoundedRectangleBorder()),
            onPressed: () {},
            child: Container(
                alignment: Alignment.center, child: Text('Save info'))),
      ),
    );
  }
}
