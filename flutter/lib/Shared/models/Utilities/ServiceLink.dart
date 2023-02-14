import 'package:mezcalmos/Shared/models/Orders/Order.dart';

class ServiceLink {
  int id;

  String? operatorDeepLink;
  String? operatorQrImageLink;
  String? driverDeepLink;
  String? driverQrImageLink;
  ServiceLink({
    required this.id,
    this.operatorDeepLink,
    this.operatorQrImageLink,
    this.driverDeepLink,
    this.driverQrImageLink,
  });

  ServiceLink copyWith({
    int? id,
    int? serivceProviderId,
    OrderType? serviceProviderType,
    String? operatorDeepLink,
    String? operatorQrImageLink,
    String? driverDeepLink,
    String? driverQrImageLink,
  }) {
    return ServiceLink(
      id: id ?? this.id,
      operatorDeepLink: operatorDeepLink ?? this.operatorDeepLink,
      operatorQrImageLink: operatorQrImageLink ?? this.operatorQrImageLink,
      driverDeepLink: driverDeepLink ?? this.driverDeepLink,
      driverQrImageLink: driverQrImageLink ?? this.driverQrImageLink,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'operatorDeepLink': operatorDeepLink,
      'operatorQrImageLink': operatorQrImageLink,
      'driverDeepLink': driverDeepLink,
      'driverQrImageLink': driverQrImageLink,
    };
  }

  @override
  String toString() {
    return 'ServiceLink(id: $id, , operatorDeepLink: $operatorDeepLink, operatorQrImageLink: $operatorQrImageLink, driverDeepLink: $driverDeepLink, driverQrImageLink: $driverQrImageLink)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ServiceLink &&
        other.id == id &&
        other.operatorDeepLink == operatorDeepLink &&
        other.operatorQrImageLink == operatorQrImageLink &&
        other.driverDeepLink == driverDeepLink &&
        other.driverQrImageLink == driverQrImageLink;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        operatorDeepLink.hashCode ^
        operatorQrImageLink.hashCode ^
        driverDeepLink.hashCode ^
        driverQrImageLink.hashCode;
  }
}
