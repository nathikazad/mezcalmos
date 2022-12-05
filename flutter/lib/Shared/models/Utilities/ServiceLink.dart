import 'package:mezcalmos/Shared/models/Orders/Order.dart';

class ServiceLink {
  int id;
  int serivceProviderId;
  OrderType serviceProviderType;
  String? operatorDeepLink;
  String? operatorQrImageLink;
  String? driverDeepLink;
  String? driverQrImageLink;
  ServiceLink({
    required this.id,
    required this.serivceProviderId,
    required this.serviceProviderType,
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
      serivceProviderId: serivceProviderId ?? this.serivceProviderId,
      serviceProviderType: serviceProviderType ?? this.serviceProviderType,
      operatorDeepLink: operatorDeepLink ?? this.operatorDeepLink,
      operatorQrImageLink: operatorQrImageLink ?? this.operatorQrImageLink,
      driverDeepLink: driverDeepLink ?? this.driverDeepLink,
      driverQrImageLink: driverQrImageLink ?? this.driverQrImageLink,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'serivceProviderId': serivceProviderId,
      'serviceProviderType': serviceProviderType.toFirebaseFormatString(),
      'operatorDeepLink': operatorDeepLink,
      'operatorQrImageLink': operatorQrImageLink,
      'driverDeepLink': driverDeepLink,
      'driverQrImageLink': driverQrImageLink,
    };
  }

  @override
  String toString() {
    return 'ServiceLink(id: $id, serivceProviderId: $serivceProviderId, serviceProviderType: $serviceProviderType, operatorDeepLink: $operatorDeepLink, operatorQrImageLink: $operatorQrImageLink, driverDeepLink: $driverDeepLink, driverQrImageLink: $driverQrImageLink)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ServiceLink &&
        other.id == id &&
        other.serivceProviderId == serivceProviderId &&
        other.serviceProviderType == serviceProviderType &&
        other.operatorDeepLink == operatorDeepLink &&
        other.operatorQrImageLink == operatorQrImageLink &&
        other.driverDeepLink == driverDeepLink &&
        other.driverQrImageLink == driverQrImageLink;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        serivceProviderId.hashCode ^
        serviceProviderType.hashCode ^
        operatorDeepLink.hashCode ^
        operatorQrImageLink.hashCode ^
        driverDeepLink.hashCode ^
        driverQrImageLink.hashCode;
  }
}
