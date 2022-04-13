import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/LaundryApp/controllers/laundryInfoController.dart';
import 'package:mezcalmos/LaundryApp/pages/EditInfoView/components/languageSelectorComponent.dart';
import 'package:mezcalmos/LaundryApp/pages/EditInfoView/controllers/EditInfoController.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Services/Laundry.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/widgets/mezEditableWorkingHours.dart';

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // padding: const EdgeInsets.all(10),

            children: [
              // image
              Obx(
                () => Center(
                  child: CircleAvatar(
                      radius: 70,
                      backgroundImage: (editInfoController.newImageFile.value !=
                              null)
                          ? FileImage(editInfoController.newImageFile.value!)
                          : CachedNetworkImageProvider(
                                  editInfoController.newImageUrl.value ??
                                      editInfoController.currentImageUrl)
                              as ImageProvider,
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
                                  decoration: BoxDecoration(
                                      color: Colors.black.withOpacity(0.5)),
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
              ),
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
                decoration:
                    InputDecoration(filled: true, fillColor: Colors.white),
              ),
              SizedBox(
                height: 15,
              ),
              Text('Default launguage'),
              LanguageSelectorComponent(
                  languageValue: editInfoController.primaryLang,
                  onChangeShouldUpdateLang:
                      editInfoController.validatePrimaryLanguUpdate),

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
                languageValue: editInfoController.secondaryLang,
                onChangeShouldUpdateLang:
                    editInfoController.validateSecondaryLanguUpdate,
                showDeleteIcon: true,
              ),
              SizedBox(
                height: 15,
              ),
              Text('Location'),
              SizedBox(
                height: 5,
              ),
              Obx(
                () => Card(
                  child: InkWell(
                    borderRadius: BorderRadius.circular(10),
                    onTap: () async {
                      // TODO @m66are change the pick location view to shared page and work with it here

                      await Get.toNamed(kPickLocation)!.then((value) {
                        if (value != null) {
                          mezDbgPrint("newwwww loc $value");
                          editInfoController.setNewLocation(value);
                        }
                      });
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
                              flex: 5,
                              fit: FlexFit.tight,
                              child: Text(
                                editInfoController.newLocation.value?.address ??
                                    'Laundry adress',
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              )),
                          Spacer(),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: keyAppColor,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              MezEditableWorkingHours(
                schedule: editInfoController.newSchedule,
                editMode: true,
              ),

              SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 50,
        child: Obx(
          () => TextButton(
              style: TextButton.styleFrom(shape: RoundedRectangleBorder()),
              onPressed: (editInfoController.btnClicked.value)
                  ? null
                  : () {
                      editInfoController
                          .updateLaundryInfo()
                          .then((value) => Get.back());
                    },
              child: (editInfoController.btnClicked.value)
                  ? Container(
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    )
                  : Container(
                      alignment: Alignment.center, child: Text('Save info'))),
        ),
      ),
    );
  }
}
