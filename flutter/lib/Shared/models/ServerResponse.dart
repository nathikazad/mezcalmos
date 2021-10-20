import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';

enum ResponseStatus { Success, Error }

extension ParseToString on ResponseStatus {
  String toShortString() {
    return this.toString().split('.').last;
  }
}

ResponseStatus convertStringToResponseStatus(String str) {
  return ResponseStatus.values
      .firstWhere((e) => e.toShortString().toLowerCase() == str.toLowerCase());
}

class ServerResponse {
  ResponseStatus status;
  String? errorMessage;
  String? errorCode;
  ServerResponse(this.status, {this.errorMessage, this.errorCode});
  bool get success => this.status == ResponseStatus.Success;
  factory ServerResponse.fromJson(dynamic json) {
    mezDbgPrint(json);
    ResponseStatus status = convertStringToResponseStatus(json["status"]);
    String? errorMessage = json["errorMessage"] ?? null;
    String? errorCode = json["errorCode"] ?? null;
    return ServerResponse(status,
        errorMessage: errorMessage, errorCode: errorCode);
  }
}
