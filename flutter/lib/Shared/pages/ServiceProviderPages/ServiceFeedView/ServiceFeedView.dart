import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Components/NoPostsFound.dart';
import 'package:mezcalmos/CustomerApp/router/customerRoutes.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/controllers/sideMenuDrawerController.dart';
import 'package:mezcalmos/Shared/models/Utilities/Post.dart';
import 'package:mezcalmos/Shared/pages/ServiceProviderPages/ServiceFeedView/components/BsFeedCardPost.dart';
import 'package:mezcalmos/Shared/pages/ServiceProviderPages/ServiceFeedView/controllers/ServiceFeedViewController.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/widgets/MezAppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';
import 'package:mezcalmos/Shared/widgets/MezSideMenu.dart';
import 'package:mezcalmos/Shared/widgets/MezStringDropDown.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["Shared"]["pages"]
    ['ServiceFeedView']['ServiceFeedView'];

class ServiceFeedView extends StatelessWidget {
  final bool asTab;
  ServiceFeedView({super.key, this.asTab = false});

  static Future<void> navigate() {
    return MezRouter.toPath(CustomerRoutes.customerOrdersRoute);
  }

  final ServiceFeedViewController _viewController =
      ServiceFeedViewController.init();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: Get.find<SideMenuDrawerController>().getNewKey(),
        drawer: MezSideMenu(),
        appBar: MezcalmosAppBar(
            asTab ? AppBarLeftButtonType.Menu : AppBarLeftButtonType.Back,
            onClick: asTab ? null : MezRouter.back,
            title: '${_i18n()['title']}'),
        body: SingleChildScrollView(
          child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
            Card(
              elevation: 0,
              margin: EdgeInsets.all(7.5),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  smallSepartor,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundImage: CachedNetworkImageProvider(
                            _viewController.authController.user!.image),
                      ),
                      hSmallSepartor,
                      Expanded(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.only(
                                    bottom: 10, left: 10, right: 10),
                                decoration: BoxDecoration(
                                    color: Colors
                                        .grey.shade200, //const Color(0XFAFAFA),
                                    borderRadius: BorderRadius.circular(5)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Material(
                                        color: Colors.transparent,
                                        child: TextField(
                                            controller: _viewController
                                                .postDescriptionController,
                                            decoration: InputDecoration(
                                                focusedBorder: InputBorder.none,
                                                fillColor: Colors.transparent,
                                                filled: true,
                                                border: InputBorder.none,
                                                hintText:
                                                    '${_i18n()['writeSomethingHere']}',
                                                hintStyle:
                                                    TextStyle(fontSize: 16),
                                                contentPadding:
                                                    EdgeInsets.symmetric(
                                                        vertical: 8.0)))),
                                    smallSepartor,
                                    Obx(() => _viewController.selectedImage != null
                                        ? Container(
                                            width: 55,
                                            height: 55,
                                            decoration: BoxDecoration(
                                                color: Colors.grey.shade300,
                                                image: DecorationImage(
                                                    fit: BoxFit.cover,
                                                    image: FileImage(File(
                                                        _viewController
                                                            .selectedImage!
                                                            .path))),
                                                borderRadius:
                                                    BorderRadius.circular(7.5)),
                                            child: Align(
                                                alignment: Alignment.topRight,
                                                child: GestureDetector(
                                                    onTap: () => _viewController
                                                        .removeImage(),
                                                    child:
                                                        Icon(Icons.cancel, size: 20))))
                                        : SizedBox.shrink())
                                    // Obx(
                                    //   () => Wrap(
                                    //       spacing: 5,
                                    //       runSpacing: 5,
                                    //       children: List<Widget>.generate(
                                    //           _viewController
                                    //               .selectedImages.length,
                                    //           (int index) => Container(
                                    //               width: 55,
                                    //               height: 55,
                                    //               decoration: BoxDecoration(
                                    //                   color: Colors.grey.shade300,
                                    //                   image: DecorationImage(
                                    //                       fit: BoxFit.cover,
                                    //                       image: FileImage(File(
                                    //                           _viewController
                                    //                               .selectedImages[
                                    //                                   index]
                                    //                               .path))),
                                    //                   borderRadius:
                                    //                       BorderRadius.circular(
                                    //                           7.5)),
                                    //               child: Align(
                                    //                   alignment: Alignment.topRight,
                                    //                   child: GestureDetector(onTap: () => _viewController.removeImage(index), child: Icon(Icons.cancel, size: 20)))))),
                                    // )
                                  ],
                                ),
                              ),
                              smallSepartor,
                              smallSepartor,
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Icon(Icons.timer),
                                  hSmallSepartor,
                                  Text('${_i18n()['expire']}'),
                                  hSmallSepartor,
                                  SizedBox(
                                    height: 32.5,
                                    width: 110,
                                    child: MezStringDropDown(
                                        isExpanded: true,
                                        labelText: 'Never',
                                        langPath: _i18n(),
                                        items: <String>[
                                          'never',
                                          'oneDay',
                                          'twoDays',
                                          'oneWeek'
                                        ],
                                        onChanged:
                                            _viewController.onDropDownChange),
                                  )
                                ],
                              ),
                              // Align(
                              //   alignment: Alignment.centerLeft,
                              //   child: ListTile(
                              //     minVerticalPadding: 0,
                              //     leading: Text(
                              //       '${_i18n()['expire']}',
                              //       textAlign: TextAlign.start,
                              //     ),
                              //     title: MezStringDropDown(
                              //         labelText: 'Never',
                              //         langPath: _i18n(),
                              //         items: <String>[
                              //           'never',
                              //           'oneDay',
                              //           'twoDays',
                              //           'week'
                              //         ],
                              //         onChanged: (_) {}),
                              //   ),
                              // ),
                              // SizedBox(
                              //   width: 200,
                              //   height: 500,
                              //   child: Row(
                              //     mainAxisSize: MainAxisSize.min,
                              //     children: [
                              //       Text('${_i18n()['expire']}'),
                              //       MezStringDropDown(
                              //           labelText: 'Never',
                              //           langPath: _i18n(),
                              //           items: <String>[
                              //             'never',
                              //             'oneDay',
                              //             'twoDays',
                              //             'week'
                              //           ],
                              //           onChanged: (_) {}),
                              //     ],
                              //   ),
                              // ),
                              // Wrap(
                              //     spacing: 5,
                              //     runSpacing: 5,
                              //     children: List<Widget>.generate(
                              //         5,
                              //         (int index) => Container(
                              //             width: 55,
                              //             height: 55,
                              //             decoration: BoxDecoration(
                              //                 color: Colors.grey.shade300,
                              //                 borderRadius:
                              //                     BorderRadius.circular(7.5)),
                              //             child: Align(
                              //                 alignment: Alignment.topRight,
                              //                 child: GestureDetector(
                              //                     onTap: () {},
                              //                     child: Icon(Icons.cancel,
                              //                         size: 20))))))
                            ]),
                      )
                    ],
                  ),
                  Divider(
                    color: Colors.grey.shade300,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () => _viewController.pickImage(
                              context, ImageSource.camera),
                          child: Row(children: <Widget>[
                            Icon(
                              Icons.add_a_photo_rounded,
                              size: 20,
                            ),
                            hSmallSepartor,
                            Text(
                              '${_i18n()['takePicture']}',
                              style: TextStyle(fontSize: 15),
                            )
                          ]),
                        ),
                        GestureDetector(
                          onTap: () => _viewController.pickImage(
                              context, ImageSource.gallery),
                          child: Row(children: <Widget>[
                            Icon(
                              Icons.add_photo_alternate_rounded,
                              size: 20,
                            ),
                            hSmallSepartor,
                            Text(
                              '${_i18n()['uploadPicture']}',
                              style: TextStyle(fontSize: 15),
                            )
                          ]),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.5),
                    child: MezButton(
                      label: '${_i18n()['publish']}',
                      height: 42.5,
                      onClick: () => _viewController.publish(),
                    ),
                  ),
                ],
              ),
            ),
            smallSepartor,
            Obx(() => _viewController.posts.isEmpty
                ? NoPostsFound()
                : Column(
                    children: List.generate(
                        _viewController.posts.length,
                        (int index) => BsFeedCardPost(
                            controller: _viewController,
                            post: _viewController.posts[index])),
                  )),
          ]),
        ));
  }
}
