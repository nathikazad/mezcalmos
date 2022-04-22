import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:in_app_update/in_app_update.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/appVersionController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/_MezUpdateHelper.dart';
import 'package:mezcalmos/Shared/helpers/PlatformOSHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:new_version/new_version.dart' show VersionStatus;
import 'package:store_redirect/store_redirect.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['Shared']['pages']
    ['AppNeedsUpdateScreen'];

class AppNeedsUpdateScreen extends StatefulWidget {
  const AppNeedsUpdateScreen({Key? key}) : super(key: key);

  @override
  State<AppNeedsUpdateScreen> createState() => _AppNeedsUpdateScreenState();
}

class _AppNeedsUpdateScreenState extends State<AppNeedsUpdateScreen> {
  final AppVersionController _controller = AppVersionController.instance();

  RxBool _isDownloading = false.obs;
  UpdateType _updateType = UpdateType.Null;
  VersionStatus? _versionStatus;
  String? _iosAppleAppIdSnapshot;

  @override
  void initState() {
    _updateType = Get.arguments?['updateType'];
    _versionStatus = Get.arguments?['versionStatus'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Colors.white,
        floatingActionButton: _floatingActionBtn(),
        appBar: mezcalmosAppBar(AppBarLeftButtonType.Back),
        body: Center(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Obx(
                () => Flex(
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
                    if (_versionStatus != null)
                      Flexible(
                        flex: 1,
                        child: Text(
                          _i18n()['newVersion'], //remoteVersion
                          textAlign: TextAlign.center,
                          style:
                              Theme.of(context).textTheme.bodyText1!.copyWith(
                                    fontSize: 18,
                                    color: Colors.purple.shade900,
                                  ),
                        ),
                      ),
                    Flexible(
                      flex: Platform.isAndroid ? 3 : 2,
                      child: Platform.isAndroid
                          ? _androidUpdateInfosAndButton()
                          : _iosUpdateInfos(context),
                    ),

                    isDownloadInProgress(context),

                    //else
                  ],
                ),
              )),
        ),
      ),
    );
  }

  Widget? _floatingActionBtn() {
    return Platform.isAndroid
        ? null
        : FloatingActionButton(
            tooltip: _i18n()['downloadNewVersion'],
            focusColor: Colors.white,
            hoverColor: Colors.white,
            splashColor: Colors.white,
            foregroundColor: Colors.purple.shade400,
            backgroundColor: Colors.white,
            onPressed: () async {
              _iosAppleAppIdSnapshot ??=
                  await MethodChannel('penf00k.ru/env_native')
                      .invokeMethod<String?>('getString', 'MezAppleAppId');

              mezDbgPrint(
                "[BundleID] => ${getPackageName(platform: MezPlatform.IOS)} | [ID] => $_iosAppleAppIdSnapshot",
              );
              // ignore: unawaited_futures
              StoreRedirect.redirect(
                iOSAppId: getPackageName(platform: MezPlatform.IOS),
              );
            },
            child: Icon(Icons.download),
          );
  }

  Flexible isDownloadInProgress(BuildContext context) {
    return Flexible(
      flex: 1,
      child: _isDownloading.value
          ? Text(
              _i18n()['downloading'],
              //remoteVersion
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontSize: 16,
                    color: Colors.purple.shade900,
                  ),
            )
          : const SizedBox.shrink(),
    );
  }

  Container _iosUpdateInfos(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 20),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              "v${_versionStatus?.storeVersion} ${_i18n()['news']}",
              textAlign: TextAlign.center,
              style:
                  Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 20),
            ),
            const SizedBox(height: 25),
            Text(
              _versionStatus?.releaseNotes ?? "-",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.subtitle2!.copyWith(),
            ),
          ],
        ),
      ),
    );
  }

  Column _androidUpdateInfosAndButton() {
    return Column(
      children: <Widget>[
        if (_versionStatus != null && _versionStatus!.releaseNotes != null) ...[
          Center(
            child: Text(
              'v${_versionStatus?.storeVersion} ${_i18n()['news']}',
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 26),
          Text(
            _versionStatus?.releaseNotes ?? "-",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.subtitle2!.copyWith(),
          )
        ],
        const SizedBox(height: 26),
        ElevatedButton(
          child: Text(_i18n()['update']),
          onPressed: () async {
            _isDownloading.value = true;
            final AppUpdateResult? _res =
                await _controller.startAppUpdate(_updateType);
            mezDbgPrint("Screen ==> _res = $_res");
            // _handleUpdateResults(_res);
            _isDownloading.value = false;
          },
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(
              horizontal: 36,
            ),
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  // void _handleUpdateResults(MezAppUpdateResult? _result) {
  //   switch (_result) {
  //     case MezAppUpdateResult.success:
  //       // TODO : reopen app.
  //       break;
  //     case MezAppUpdateResult.inAppUpdateFailed:

  //     case MezAppUpdateResult.redirectedToStore:
  //     case MezAppUpdateResult.userDeniedUpdate:
  //     default:
  //   }
  // }
}
