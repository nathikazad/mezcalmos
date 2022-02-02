// Usefull when trying to make Sizes adptable!
import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:get/get.dart';
import 'dart:ui' as ui;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:image_picker/image_picker.dart' as imPicker;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/widgets/MezSnackbar.dart';

String generateRandomString(int len) {
  var r = Random();
  const _chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  return List.generate(len, (index) => _chars[r.nextInt(_chars.length)]).join();
}

/// this compresses the Original Image using jpeg format Since it's much ligher.
///
/// and reduce the quality down to [qualityCompressionOfUserImage = 25%].
Future<Uint8List> compressImageBytes(Uint8List originalImg) async {
  mezDbgPrint("s@s:beforeCompress => ${originalImg.lengthInBytes}");
  final result = await FlutterImageCompress.compressWithList(originalImg,
      quality: nQualityCompressionOfUserImage);
  mezDbgPrint("s@s:after => ${result.lengthInBytes}");
  return result;
}

Future<File> writeFileFromBytesAndReturnIt(
    {required String filePath, required Uint8List imgBytes}) async {
  // compressed Image
  List<String> splittedPath = filePath.split('.');
  String pathWithoutExtension =
      splittedPath.sublist(0, splittedPath.length - 1).join('.');
  mezDbgPrint("PATH WITHOUT EXTENSION $pathWithoutExtension");
  mezDbgPrint("PATH WITH EXTENSION ${filePath}");

  return (await File(
          '${pathWithoutExtension}.${DateTime.now().millisecondsSinceEpoch}.${splittedPath.last}')
      .writeAsBytes(imgBytes));
}

/// this is only used for UserProfilePicture whereever we show bigImage [User.bigImage]
Image showDefaultOrUserImg({Uint8List? memoryImg}) {
  if (memoryImg != null) {
    return mLoadImage(
        url: null, memoryImage: memoryImg, assetInCaseFailed: aLogoPath);
  }
  return mLoadImage(
      url: Get.find<AuthController>().user!.bigImage ??
          Get.find<AuthController>().user!.image,
      assetInCaseFailed: aLogoPath);
}

Future<imPicker.ImageSource?> imagePickerChoiceDialog(
    BuildContext context) async {
  imPicker.ImageSource? _result;

  await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          contentPadding: EdgeInsets.all(40),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 10.h,
              ),
              TextButton(
                  onPressed: () {
                    _result = imPicker.ImageSource.camera;
                    Get.back();
                  },
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.purple.shade400,
                      padding: EdgeInsets.all(12)),
                  child: Container(
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.camera_enhance,
                            color: Colors.white,
                          ),
                          Text('Camera')
                        ],
                      ))),
              SizedBox(
                height: 10,
              ),
              TextButton(
                  onPressed: () {
                    _result = imPicker.ImageSource.gallery;
                    Get.back();
                  },
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.deepPurple,
                      padding: EdgeInsets.all(12)),
                  child: Container(
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.photo_library_outlined,
                            color: Colors.white,
                          ),
                          Text('Gallery')
                        ],
                      ))),
            ],
          ),
        );
      });

  return _result;
}

Future<imPicker.XFile?> imagePicker(
    {required imPicker.ImagePicker picker,
    imPicker.ImageSource source = imPicker.ImageSource.gallery}) async {
  try {
    return await picker.pickImage(
      source: source,
      preferredCameraDevice: imPicker.CameraDevice.front,
      imageQuality: nQualityCompressionOfUserImage,
    );
  } on PlatformException catch (exception) {
    if (exception.code == 'camera_access_denied') {
      MezSnackbar(
          Get.find<LanguageController>().strings['shared']['permissions']
              ['cameraAccessOffTitle'],
          Get.find<LanguageController>().strings['shared']['permissions']
              ['cameraAccessOffBody'],
          position: SnackPosition.TOP);
    } else if (exception.code == 'photo_access_denied') {
      MezSnackbar(
          Get.find<LanguageController>().strings['shared']['permissions']
              ['photoAccessOffTitle'],
          Get.find<LanguageController>().strings['shared']['permissions']
              ['photoAccessOffBody'],
          position: SnackPosition.TOP);
    } else {
      return await picker.pickImage(
        source: source,
        preferredCameraDevice: imPicker.CameraDevice.front,
        imageQuality: nQualityCompressionOfUserImage,
      );
    }
    return null;
  }
}

Image mLoadImage(
    {required String? url,
    Uint8List? memoryImage,
    double? height,
    double? width,
    fit: BoxFit.cover,
    String assetInCaseFailed = aNoImgAsset}) {
  Image _img;

  if (url == null ||
      url.toLowerCase().contains('.svg') ||
      !url.startsWith('http')) {
    try {
      if (memoryImage != null) {
        _img = Image.memory(
          memoryImage,
          height: height,
          width: width,
          fit: BoxFit.contain,
        );
      } else {
        _img = Image.asset(
          url!,
          height: height,
          width: width,
          fit: BoxFit.contain,
        );
      }
    } catch (e) {
      _img = Image.asset(
        assetInCaseFailed,
        height: height,
        width: width,
        fit: BoxFit.contain,
      );
    }
  } else {
    _img = Image.network(
      url,
      height: height,
      width: width,
      fit: fit,
    );
  }

  return _img;
}

// BitmapLoading stuff -------------------

Future<BitmapDescriptor> BitmapDescriptorLoader(
    dynamic asset, num width, num height,
    {bool isBytes = false}) async {
  return BitmapDescriptor.fromBytes(
      await getBytesFromCanvas(width, height, asset, isBytes: isBytes));
  // return await getBytesFromCanvas(width, height, asset, isBytes: isBytes);
}

Future<Uint8List> getBytesFromCanvas(num width, num height, urlAsset,
    {bool isBytes = false}) async {
  final ui.PictureRecorder pictureRecorder = ui.PictureRecorder();
  final ui.Canvas canvas = ui.Canvas(pictureRecorder);
  late final ByteData datai;

  if (!isBytes) datai = await rootBundle.load(urlAsset);
  var imaged =
      await loadImage(!isBytes ? new Uint8List.view(datai.buffer) : urlAsset);
  canvas.drawImageRect(
    imaged,
    ui.Rect.fromLTRB(
        0.0, 0.0, imaged.width.toDouble(), imaged.height.toDouble()),
    ui.Rect.fromLTRB(0.0, 0.0, width.toDouble(), height.toDouble()),
    new ui.Paint(),
  );

  final img = await pictureRecorder
      .endRecording()
      .toImage(width.toInt(), height.toInt());
  final data = await img.toByteData(format: ui.ImageByteFormat.png);
  return data!.buffer.asUint8List();
}

Future<ui.Image> loadImage(Uint8List img) async {
  final Completer<ui.Image> completer = new Completer();
  ui.decodeImageFromList(img, (ui.Image img) {
    return completer.complete(img);
  });
  return completer.future;
}

Future<List<int>> cropRonded(Uint8List bytes) async {
  ui.Image image = await loadImage(bytes);
  var recorder = ui.PictureRecorder();
  var canvas = Canvas(recorder);
  var imageSize = Size(image.width.toDouble(), image.height.toDouble());
  var boundsToCrop = Rect.fromCenter(
      center: imageSize.center(Offset.zero),
      width: imageSize.shortestSide,
      height: imageSize.shortestSide);
  var matrix = Matrix4.translationValues(
          -boundsToCrop.topLeft.dx, -boundsToCrop.topLeft.dy, 0)
      .storage;
  var paint = Paint()
    ..shader = ImageShader(image, TileMode.clamp, TileMode.clamp, matrix);
  var radius = imageSize.shortestSide / 2;
  canvas.drawCircle(Offset(radius, radius), radius, paint);

  ui.Image cropped = await recorder
      .endRecording()
      .toImage(imageSize.shortestSide.toInt(), imageSize.shortestSide.toInt());
  var byteData = await cropped.toByteData(format: ui.ImageByteFormat.png);

  return byteData!.buffer.asUint8List();
}
