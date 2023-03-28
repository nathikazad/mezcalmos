// Usefull when trying to make Sizes adptable!
import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_compression_flutter/image_compression_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart' as imPicker;
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/ContextHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';
import 'package:mezcalmos/Shared/widgets/MezSnackbar.dart';
import 'package:sizer/sizer.dart';
import 'dart:html' as html;
import 'package:flutter/foundation.dart' show kIsWeb;

dynamic _i18n() =>
    Get.find<LanguageController>().strings['Shared']['helpers']['ImageHelper'];

/// this compresses the Original Image using jpeg format Since it's much ligher.
///
/// and reduce the quality down to [qualityCompressionOfUserImage = 25%].
Future<Uint8List> compressImageBytes(Uint8List uint8list, String path) async {
  Configuration config = Configuration(
    outputType: ImageOutputType.jpg,
    useJpgPngNativeCompressor: true,
    quality: nQualityCompressionOfUserImage,
  );
  mezDbgPrint("🖼️🖼️🖼️🖼️🖼️🖼️🖼️🖼️ the path is image.path ${path}");
  final ImageFileConfiguration param = ImageFileConfiguration(
      input: ImageFile(filePath: path, rawBytes: uint8list), config: config);
  final ImageFile output = await compressor.compress(param);
  mezDbgPrint(
      "🖼️🖼️🖼️🖼️🖼️🖼️🖼️🖼️ the path is image.path ${output.rawBytes}");
  return output.rawBytes;
}

Future<File> writeFileFromBytesAndReturnIt(
    {required String filePath, required Uint8List imgBytes}) async {
  // compressed Image
  final List<String> splittedPath = filePath.split('.');
  final String pathWithoutExtension =
      splittedPath.sublist(0, splittedPath.length - 1).join('.');
  mezDbgPrint("PATH WITHOUT EXTENSION $pathWithoutExtension");
  mezDbgPrint("PATH WITH EXTENSION $filePath");

  return (await File(
          '$pathWithoutExtension.${DateTime.now().millisecondsSinceEpoch}.${splittedPath.last}')
      .writeAsBytes(imgBytes));
}

Future<html.File> writeFileFromBytesAndReturnItForWeb(
    {required String filePath,
    required Uint8List imgBytes,
    required dynamic mimeType}) async {
  // compressed Image
  final List<String> splittedPath = filePath.split('.');
  final String pathWithoutExtension =
      splittedPath.sublist(0, splittedPath.length - 1).join('.');
  mezDbgPrint("PATH WITHOUT EXTENSION $pathWithoutExtension");
  mezDbgPrint("PATH WITH EXTENSION $filePath");
  return html.File(
      imgBytes,
      '$pathWithoutExtension.${DateTime.now().millisecondsSinceEpoch}.${splittedPath.last}',
      {'type': mimeType});
  // return (await File(
  //         '$pathWithoutExtension.${DateTime.now().millisecondsSinceEpoch}.${splittedPath.last}')
  //     .writeAsBytes(imgBytes));
}

/// this is only used for UserProfilePicture whereever we show bigImage [User.bigImage]
Image showDefaultOrUserImg({Uint8List? memoryImg}) {
  if (memoryImg != null) {
    return mLoadImage(
        url: null,
        memoryImage: memoryImg,
        assetInCaseFailed: aDefaultDbUserImgAsset);
  }

  return mLoadImage(
      url: Get.find<AuthController>().user!.image,
      assetInCaseFailed: aDefaultDbUserImgAsset);
}

Future<String?> pickImageChoiceDialogForWeb(BuildContext context) {
  return showDialog<String?>(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      // title: const Text('AlertDialog Title'),
      content: Container(
        width: 100.sp,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            MezButton(
              backgroundColor: Colors.white,
              label: "Upload photo",
              onClick: () async {
                Navigator.pop(context, "yes");
              },
            ),
            Divider(),
            MezButton(
              backgroundColor: Colors.white,
              label: "Cancel",
              onClick: () async {
                Navigator.pop(context, "no");
              },
            ),
          ],
        ),
      ),
    ),
  );
}

Future<imPicker.ImageSource?> imagePickerChoiceDialog(
    BuildContext context) async {
  imPicker.ImageSource? _result;

  await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.all(0),
          content: Container(
            width: 90.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    _result = imPicker.ImageSource.camera;
                    MezRouter.back();
                  },
                  child: Container(
                    padding:
                        EdgeInsets.only(left: 8, right: 8, top: 10, bottom: 5),
                    child: Center(
                      child: Row(
                        children: [
                          Icon(Icons.camera_alt_outlined),
                          SizedBox(width: 11),
                          Flexible(
                            child: Text("${_i18n()["fromCamera"]}",
                                style: context.txt.bodyText1),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Divider(),
                InkWell(
                  onTap: () {
                    _result = imPicker.ImageSource.gallery;
                    MezRouter.back();
                  },
                  child: Container(
                    padding:
                        EdgeInsets.only(left: 8, right: 8, top: 5, bottom: 10),
                    child: Center(
                      child: Row(
                        children: [
                          Icon(Icons.photo_library_outlined),
                          SizedBox(width: 11),
                          Flexible(
                            child: Text("${_i18n()["fromGallery"]}",
                                style: context.txt.bodyText1),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
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
          _i18n()['cameraAccessOffTitle'], _i18n()['cameraAccessOffBody'],
          position: SnackPosition.TOP);
    } else if (exception.code == 'photo_access_denied') {
      MezSnackbar(_i18n()['photoAccessOffTitle'], _i18n()['photoAccessOffBody'],
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

Image mLoadImage({
  required String? url,
  Uint8List? memoryImage,
  double? height,
  double? width,
  fit: BoxFit.cover,
  String assetInCaseFailed = aNoImgAsset,
}) {
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
Future<BitmapDescriptor> bitmapDescriptorLoader(asset, num width, num height,
    {bool isBytes = false, String? urlStr}) async {
  mezDbgPrint(
      "[cc] this function ($width , $height) called bitmapDescriptorLoader  :: Asset => ${asset.runtimeType}  | isByte ==> $isBytes");
  if (kIsWeb)
    return BitmapDescriptor.fromBytes(
      asset,
      size: Size(
        width.toDouble() / 2,
        height.toDouble() / 2,
      ),
      // await getBytesFromCanvas(width, height, asset, isBytes: isBytes),
    );
  else
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
  final ui.Image imaged =
      await loadImage(!isBytes ? new Uint8List.view(datai.buffer) : urlAsset);
  canvas.drawImageRect(
    imaged,
    ui.Rect.fromLTRB(
        0.0, 0.0, imaged.width.toDouble(), imaged.height.toDouble()),
    ui.Rect.fromLTRB(0.0, 0.0, width.toDouble(), height.toDouble()),
    new ui.Paint(),
  );

  final ui.Image img = await pictureRecorder
      .endRecording()
      .toImage(width.toInt(), height.toInt());
  final ByteData? data = await img.toByteData(format: ui.ImageByteFormat.png);
  return data!.buffer.asUint8List();
}

Future<ui.Image> loadImage(Uint8List img) async {
  final Completer<ui.Image> completer = new Completer();
  ui.decodeImageFromList(img, (ui.Image img) {
    mezDbgPrint("[cc] COMPLEEEEETER DONE! $img");
    completer.complete(img);
  });
  return completer.future;
}

Future<List<int>> cropRonded(Uint8List bytes) async {
  final ui.Image image = await loadImage(bytes);
  final ui.PictureRecorder recorder = ui.PictureRecorder();
  final ui.Canvas canvas = Canvas(recorder);
  final ui.Size imageSize =
      Size(image.width.toDouble(), image.height.toDouble());
  final ui.Rect boundsToCrop = Rect.fromCenter(
      center: imageSize.center(Offset.zero),
      width: imageSize.shortestSide,
      height: imageSize.shortestSide);
  final Float64List matrix = Matrix4.translationValues(
          -boundsToCrop.topLeft.dx, -boundsToCrop.topLeft.dy, 0)
      .storage;
  final ui.Paint paint = Paint()
    ..shader = ImageShader(image, TileMode.clamp, TileMode.clamp, matrix);
  final double radius = imageSize.shortestSide / 2;
  canvas.drawCircle(Offset(radius, radius), radius, paint);

  final ui.Image cropped = await recorder
      .endRecording()
      .toImage(imageSize.shortestSide.toInt(), imageSize.shortestSide.toInt());
  final ByteData? byteData =
      await cropped.toByteData(format: ui.ImageByteFormat.png);

  return byteData!.buffer.asUint8List();
}
