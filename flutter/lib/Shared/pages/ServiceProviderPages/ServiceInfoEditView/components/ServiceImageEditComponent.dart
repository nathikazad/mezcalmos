import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/pages/ServiceProviderPages/ServiceInfoEditView/controllers/ServiceInfoEditViewController.dart';

class ServiceImageEditComponent extends StatelessWidget {
  const ServiceImageEditComponent({
    Key? key,
    required this.editInfoController,
  }) : super(key: key);

  final ServiceInfoEditViewController editInfoController;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Center(
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            CircleAvatar(
                radius: 70,
                backgroundImage: (editInfoController.newImageFile.value != null)
                    ? FileImage(editInfoController.newImageFile.value!)
                    : CachedNetworkImageProvider(
                        editInfoController.newImageUrl.value!) as ImageProvider,
                child: (editInfoController.imageLoading.value)
                    ? Container(
                        alignment: Alignment.center,
                        decoration:
                            BoxDecoration(color: Colors.black.withOpacity(0.5)),
                        child: CircularProgressIndicator())
                    : null),
            Positioned(
                bottom: 0,
                right: 0,
                child: Material(
                  color: Colors.black,
                  shape: CircleBorder(),
                  child: InkWell(
                    customBorder: CircleBorder(),
                    onTap: () {
                      editInfoController.editImage(context);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(shape: BoxShape.circle),
                      child: Icon(
                        Icons.photo_camera,
                        size: 25,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
