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
  dynamic data;
  ServerResponse(this.status, {this.errorMessage, this.errorCode, this.data});
  bool get success => this.status == ResponseStatus.Success;
  factory ServerResponse.fromJson(dynamic json) {
    mezDbgPrint("printing the data inside ServerResponse");
    mezDbgPrint(json);
    ResponseStatus status = convertStringToResponseStatus(json["status"]);
    String? errorMessage = json["errorMessage"] ?? null;
    String? errorCode = json["errorCode"] ?? null;
    dynamic data = json;
    return ServerResponse(status,
        errorMessage: errorMessage, errorCode: errorCode, data: json);
  }
}
