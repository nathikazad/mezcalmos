import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/appVersionController.dart';
import 'package:mezcalmos/Shared/helpers/PlatformOSHelper.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:store_redirect/store_redirect.dart';

class AppNeedsUpdated extends StatelessWidget {
  AppNeedsUpdated({Key? key}) : super(key: key);
  final AppVersionController _controller = Get.find<AppVersionController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: Colors.white,
        floatingActionButton: FloatingActionButton(
          tooltip: "Download New version",
          focusColor: Colors.white,
          hoverColor: Colors.white,
          splashColor: Colors.white,
          foregroundColor: Colors.purple.shade400,
          backgroundColor: Colors.white,
          onPressed: () {
            String pkgName = getPackageName();
            StoreRedirect.redirect(androidAppId: pkgName, iOSAppId: pkgName);
          },
          child: Icon(Icons.download),
        ),
        appBar: mezcalmosAppBar(AppBarLeftButtonType.Back,
            onClick: _controller.appVersionInfos.value?.forceUpdate == true
                ? null
                : Get.back),
        body: WillPopScope(
          onWillPop: () async =>
              _controller.appVersionInfos.value?.forceUpdate == true,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Flex(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                direction: Axis.vertical,
                children: [
                  Flexible(
                    flex: 2,
                    child: Container(
                      child: Image.asset(
                        aUpdate,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: 25),
                  if (_controller.appVersionInfos.value?.updateNews != null)
                    Flexible(
                        flex: 2,
                        child: Container(
                          padding: EdgeInsets.only(bottom: 20),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: _controller
                                          .appVersionInfos.value?.updateNews !=
                                      null
                                  ? CrossAxisAlignment.start
                                  : CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "v${_controller.appVersionInfos.value!.remoteVersion} news:",
                                  textAlign: TextAlign.start,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(fontSize: 20),
                                ),
                                SizedBox(height: 25),
                                Text(
                                  _controller
                                      .appVersionInfos.value!.updateNews!,
                                  textAlign: TextAlign.start,
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle2!
                                      .copyWith(),
                                ),
                              ],
                            ),
                          ),
                        ))
                  else
                    Flexible(
                      flex: 2,
                      child: Text(
                        "New version ${_controller.appVersionInfos.value!.remoteVersion} is out!",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontSize: 18, color: Colors.purple.shade900),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
