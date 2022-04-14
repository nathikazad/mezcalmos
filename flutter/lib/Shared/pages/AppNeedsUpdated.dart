import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/appVersionController.dart';
import 'package:mezcalmos/Shared/helpers/PlatformOSHelper.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:store_redirect/store_redirect.dart';

class AppNeedsUpdated extends StatefulWidget {
  const AppNeedsUpdated({Key? key}) : super(key: key);

  @override
  State<AppNeedsUpdated> createState() => _AppNeedsUpdatedState();
}

class _AppNeedsUpdatedState extends State<AppNeedsUpdated> {
  /// AppVersionController
  final AppVersionController _controller = Get.find<AppVersionController>();

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();

  void showSnack(String text) {
    debugPrint('showSnack: $text');
    if (_scaffoldKey.currentContext != null) {
      ScaffoldMessenger.of(_scaffoldKey.currentContext!).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text(text),
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();

    /// checkForUpdateTypeAndPlatForm
    _controller.checkForUpdateTypeAndPlatForm();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
        valueListenable: _controller.checkUpdateResult,
        builder: (_, bool checkUpdateResult, __) {
          return WillPopScope(
            onWillPop: () async {
              if (checkUpdateResult) {
                Get.snackbar(
                  'Attention!',
                  'There is a new version. Please make sure to update the app',
                );
                return false;
              }
              return true;
            },
            child: Scaffold(
              key: _scaffoldKey,
              backgroundColor: Colors.white,
              floatingActionButton: Platform.isAndroid
                  ? null
                  : FloatingActionButton(
                      tooltip: "Download New version",
                      focusColor: Colors.white,
                      hoverColor: Colors.white,
                      splashColor: Colors.white,
                      foregroundColor: Colors.purple.shade400,
                      backgroundColor: Colors.white,
                      onPressed: () {
                        final String pkgName = getPackageName();
                        StoreRedirect.redirect(
                          androidAppId: pkgName,
                          iOSAppId: pkgName,
                        );
                      },
                      child: Icon(Icons.download),
                    ),
              appBar: mezcalmosAppBar(
                AppBarLeftButtonType.Back,
                onClick: checkUpdateResult ? null : Get.back,
              ),
              body: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Flex(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    direction: Axis.vertical,
                    children: <Widget>[
                      Flexible(
                        flex: 2,
                        child: Container(
                          child: Image.asset(
                            aUpdate,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      Flexible(
                        flex: 1,
                        child: Obx(
                          () {
                            if (_controller.status.value != null) {
                              return Text(
                                "New version ${_controller.status.value?.storeVersion} is out!", //remoteVersion
                                textAlign: TextAlign.center,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                      fontSize: 18,
                                      color: Colors.purple.shade900,
                                    ),
                              );
                            } else {
                              return const SizedBox.shrink();
                            }
                          },
                        ),
                      ),
                      //if (_controller.appVersionInfo.value?.updateNews != null)
                      Flexible(
                        flex: Platform.isAndroid ? 3 : 2,
                        child: Platform.isAndroid
                            ? Column(
                                children: <Widget>[
                                  Obx(
                                    () {
                                      if (_controller.appVersionInfo.value !=
                                          null) {
                                        return Column(
                                          children: <Widget>[
                                            Center(
                                              child: Text(
                                                'Update info: ${_controller.appVersionInfo.value.toString()}',
                                              ),
                                            ),
                                          ],
                                        );
                                      } else {
                                        return const SizedBox.shrink();
                                      }
                                    },
                                  ),
                                  const SizedBox(height: 26),
                                  ElevatedButton(
                                    child: Text('Update'),
                                    onPressed: () async {
                                      await _controller
                                          .checkForUpdateTypeAndPlatForm();
                                    },
                                    style: ElevatedButton.styleFrom(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 36,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                ],
                              )
                            : Container(
                                padding: EdgeInsets.only(bottom: 20),
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        // _controller
                                        //     .appVersionInfo.value?.updateNews !=
                                        //     null
                                        //     ? CrossAxisAlignment.start
                                        //     :
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        "v${_controller.appVersionInfo
                                        // .remoteVersion
                                        } news:",
                                        textAlign: TextAlign.start,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1!
                                            .copyWith(fontSize: 20),
                                      ),
                                      const SizedBox(height: 25),
                                      Text(
                                        "${_controller.appVersionInfo
                                        // .updateNews!
                                        }",
                                        textAlign: TextAlign.start,
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle2!
                                            .copyWith(),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                      ),

                      Flexible(
                        flex: 1,
                        child: Obx(
                          () {
                            if (_controller.isDownloading.value) {
                              return Text(
                                "A new version is being downloaded...",
                                //remoteVersion
                                textAlign: TextAlign.center,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                      fontSize: 16,
                                      color: Colors.purple.shade900,
                                    ),
                              );
                            } else {
                              return const SizedBox.shrink();
                            }
                          },
                        ),
                      ),
                      //else
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
