import 'dart:convert';

class BankInfo {
  String bankName;
  num accountNumber;
  BankInfo({
    required this.bankName,
    required this.accountNumber,
  });

  BankInfo copyWith({
    String? bankName,
    num? accountNumber,
  }) {
    return BankInfo(
      bankName: bankName ?? this.bankName,
      accountNumber: accountNumber ?? this.accountNumber,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'bankName': bankName,
      'accountNumber': accountNumber,
    };
  }

  // ignore: avoid_annotating_with_dynamic
  factory BankInfo.fromMap(dynamic map) {
    return BankInfo(
      bankName: map['bankName'] ?? '',
      accountNumber: map['accountNumber'] ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory BankInfo.fromJson(String source) =>
      BankInfo.fromMap(json.decode(source));

  @override
  String toString() =>
      'BankInfo(bankName: $bankName, accountNumber: $accountNumber)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BankInfo &&
        other.bankName == bankName &&
        other.accountNumber == accountNumber;
  }

  @override
  int get hashCode => bankName.hashCode ^ accountNumber.hashCode;
}
