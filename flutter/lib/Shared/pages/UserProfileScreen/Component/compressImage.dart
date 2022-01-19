import 'package:image/image.dart' as Im;
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:math' as Math;

Future<File> compressImage(File imageF) async {
  final tempDir = await getTemporaryDirectory();
  final path = tempDir.path;
  int rand = new Math.Random().nextInt(10000);

  Im.Image image = Im.decodeImage(imageF.readAsBytesSync())!;
  Im.Image smallerImage = Im.copyResize(image,
      width: 200,
      height: 200); // choose the size here, it will maintain aspect ratio

  var compressedImage = new File('$path/img_$rand.jpg')
    ..writeAsBytesSync(Im.encodeJpg(smallerImage, quality: 85));
  return compressedImage;
}
