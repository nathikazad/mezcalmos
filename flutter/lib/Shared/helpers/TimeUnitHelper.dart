import 'package:mezcalmos/Shared/cloudFunctions/model.dart';

extension TimeUnitHelper on TimeUnit {
  String toStringDuration() {
    final String duration = toString().split('.').last;
    if (duration.contains('Person')) {
      return 'Person';
    } else {
      return duration.contains('Per')
          ? duration.replaceAll('Per', '')
          : duration;
    }
  }
}
