import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/LaundryApp/pages/EditInfoView/controllers/EditInfoController.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';

class LaundryOpEditLocationCard extends StatelessWidget {
  LaundryOpEditLocationCard({
    Key? key,
    required this.editInfoController,
  }) : super(key: key);
  EditInfoController editInfoController;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Card(
        color: Colors.grey.shade200,
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: () async {
            // TODO @m66are change the pick location view to shared page and work with it here

            await Get.toNamed(kPickLocationWithoutAuth)!.then((value) {
              if (value != null) {
                editInfoController.setNewLocation(value);
              }
            });
          },
          child: Container(
            padding: const EdgeInsets.all(12),
            width: double.infinity,
            child: Row(
              children: [
                Icon(
                  Icons.place_rounded,
                  color: Theme.of(context).primaryColorLight,
                ),
                SizedBox(
                  width: 5,
                ),
                Flexible(
                    flex: 5,
                    fit: FlexFit.tight,
                    child: Text(
                      editInfoController.newLocation.value?.address ?? '',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    )),
                Spacer(),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Colors.black,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
