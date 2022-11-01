enum ResponseStatus { Success, Error }

extension ParseResponseStatusToString on ResponseStatus {
  String toShortString() {
    return this.toString().split('.').last;
  }
}

extension ParseStringToResponseStatus on String {
  ResponseStatus toResponseStatus() {
    return ResponseStatus.values.firstWhere(
        (e) => e.toShortString().toLowerCase() == this.toLowerCase());
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

  factory ServerResponse.fromJson(dynamic json) {
    print("printing the data inside ServerResponse");
    print(json);
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
