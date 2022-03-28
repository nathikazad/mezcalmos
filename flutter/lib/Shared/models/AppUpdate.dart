import 'package:mezcalmos/Shared/helpers/PlatformOSHelper.dart';

class AppUpdate {
  String remoteVersion;
  bool forceUpdate;
  String? updateNews;

  AppUpdate(
      {required this.remoteVersion, this.forceUpdate = false, this.updateNews});

  factory AppUpdate.fromSnapshotData(dynamic data) {
    return AppUpdate(
        remoteVersion: data['versionName'],
        forceUpdate: data['force'] ?? false,
        updateNews: data['news']);
  }

  bool areLocalAndRemoteVersionsDiffrent() =>
      getLocalVersionName() != this.remoteVersion;
}
