import 'package:mezcalmos/Shared/cloudFunctions/model.dart';

extension TimeUnitHelper on TimeUnit {
  String toStringDuration() {
    final String duration = toString().split('.').last;
    return duration.contains('Per') ? duration.replaceFirst('Per', '') : duration;
  }
}
