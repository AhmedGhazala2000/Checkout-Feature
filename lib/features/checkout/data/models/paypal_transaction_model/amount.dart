import 'details.dart';

class AmountModel {
  AmountModel({
    required this.total,
    required this.currency,
    required this.details,
  });

  AmountModel.fromJson(dynamic json) {
    total = json['total'];
    currency = json['currency'];
    details =
        json['details'] != null ? Details.fromJson(json['details']) : null;
  }

  String? total;
  String? currency;
  Details? details;

  AmountModel copyWith({
    String? total,
    String? currency,
    Details? details,
  }) =>
      AmountModel(
        total: total ?? this.total,
        currency: currency ?? this.currency,
        details: details ?? this.details,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['total'] = total;
    map['currency'] = currency;
    if (details != null) {
      map['details'] = details?.toJson();
    }
    return map;
  }
}
