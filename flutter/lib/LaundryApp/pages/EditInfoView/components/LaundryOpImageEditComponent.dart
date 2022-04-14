import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/LaundryApp/pages/EditInfoView/controllers/EditInfoController.dart';

class LaundryOpImageEditComponent extends StatelessWidget {
  const LaundryOpImageEditComponent({
    Key? key,
    required this.editInfoController,
  }) : super(key: key);

  final EditInfoController editInfoController;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Center(
        child: CircleAvatar(
            radius: 70,
            backgroundImage: (editInfoController.newImageFile.value != null)
                ? FileImage(editInfoController.newImageFile.value!)
                : CachedNetworkImageProvider(
                    editInfoController.newImageUrl.value!) as ImageProvider,
            child: Material(
              shape: CircleBorder(),
              clipBehavior: Clip.hardEdge,
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  // imagePickerChoiceDialog(context);
                  //  editImage(context);
                  editInfoController.editImage(context);
                },
                child: (editInfoController.imageLoading.value)
                    ? Container(
                        alignment: Alignment.center,
                        decoration:
                            BoxDecoration(color: Colors.black.withOpacity(0.5)),
                        child: CircularProgressIndicator())
                    : Container(
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
      ),
    );
  }
}
