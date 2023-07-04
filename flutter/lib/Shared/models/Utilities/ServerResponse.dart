import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';

enum ResponseStatus { Success, Error }

extension ParseResponseStatusToString on ResponseStatus {
  String toShortString() {
    return toString().split('.').last;
  }
}

extension ParseStringToResponseStatus on String {
  ResponseStatus toResponseStatus() {
    mezDbgPrint("Causin g so many errors ===========> $this");
    try {
      return ResponseStatus.values.firstWhere((ResponseStatus e) =>
          e.toShortString().toLowerCase() == toLowerCase());
    } catch (e) {
      return ResponseStatus.Success;
    }
  }
}

class ServerResponse {
  ResponseStatus status;
  String? errorMessage;
  String? errorCode;
  dynamic data;

  ServerResponse(
    this.status, {
    this.errorMessage,
    this.errorCode,
    this.data,
  });

  bool get success => status == ResponseStatus.Success;

  factory ServerResponse.fromJson(json) {
    mezDbgPrint("printing the data inside ServerResponse");
    mezDbgPrint(json);
    final ResponseStatus status = json["status"].toString().toResponseStatus();
    final String? errorMessage = json["errorMessage"] ?? null;
    final String? errorCode = json["errorCode"] ?? null;
    final dynamic data = json;
    return ServerResponse(
      status,
      errorMessage: errorMessage,
      errorCode: errorCode,
      data: json,
    );
  }

  @override
  String toString() {
    return "ServerResponse : { status: $status , errorCode: $errorCode , errorMessage: $errorMessage , data : $data }";
  }
}
