import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/LaundryApp/controllers/laundryInfoController.dart';
import 'package:mezcalmos/LaundryApp/pages/EditInfoView/components/languageSelectorComponent.dart';
import 'package:mezcalmos/LaundryApp/pages/EditInfoView/controllers/EditInfoController.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/models/Services/Laundry.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezWorkingHours.dart';

class LaundryOpEditInfoView extends StatefulWidget {
  const LaundryOpEditInfoView({Key? key}) : super(key: key);

  @override
  State<LaundryOpEditInfoView> createState() => _LaundryOpEditInfoViewState();
}

class _LaundryOpEditInfoViewState extends State<LaundryOpEditInfoView> {
  LaundryInfoController laundryInfoController =
      Get.find<LaundryInfoController>();

  Rxn<Laundry> laundry = Rxn();
  String? primaryLang;
  String? secondaryLang;
  EditInfoController editInfoController = EditInfoController();
  @override
  void initState() {
    laundry = laundryInfoController.laundry;
    editInfoController.init();

    super.initState();
  }

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
              backgroundImage: CachedNetworkImageProvider(
                  editInfoController.currentImageUrl),
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
            controller: editInfoController.laundryNameController,
            decoration: InputDecoration(filled: true, fillColor: Colors.white),
          ),
          SizedBox(
            height: 15,
          ),
          Text('Default launguage'),
          LanguageSelectorComponent(
            languagePriority: LanguagePriority.PrimaryLanguage,
            langValue: primaryLang,
            oppositeLang: secondaryLang,
          ),

          SizedBox(
            height: 5,
          ),
          SizedBox(
            height: 15,
          ),
          Text('Secondary launguage'),
          SizedBox(
            height: 5,
          ),
          LanguageSelectorComponent(
            languagePriority: LanguagePriority.SecondaryLanguage,
            langValue: secondaryLang,
            oppositeLang: primaryLang,
            // langValue: editInfoController.secondaryLang.value,
            // oppositeLang: editInfoController.primaryLang.value,
          ),
          SizedBox(
            height: 15,
          ),
          Text('Location'),
          SizedBox(
            height: 5,
          ),
          Card(
            child: InkWell(
              borderRadius: BorderRadius.circular(10),
              onTap: () {
                // TODO @m66are change the pick location view to shared page and work with it here
              },
              child: Container(
                padding: const EdgeInsets.all(8),
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
                        child: Text(
                      laundry.value?.info.location?.address ?? 'Laundry adress',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    )),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: keyAppColor,
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          MezWorkingHours(
            schedule: laundry.value!.schedule!,
            editMode: true,
          ),

          SizedBox(
            height: 15,
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 50,
        child: TextButton(
            style: TextButton.styleFrom(shape: RoundedRectangleBorder()),
            onPressed: () {
              laundryInfoController
                  .setLaundryName(editInfoController.laundryNameController.text)
                  .then((value) => Get.back());
            },
            child: Container(
                alignment: Alignment.center, child: Text('Save info'))),
      ),
    );
  }
}
