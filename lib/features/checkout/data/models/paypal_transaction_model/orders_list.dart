import 'items.dart';

class OrdersListModel {
  OrdersListModel({
    required this.items,
  });

  OrdersListModel.fromJson(dynamic json) {
    if (json['items'] != null) {
      items = [];
      json['items'].forEach((v) {
        items?.add(Items.fromJson(v));
      });
    }
  }

  List<Items>? items;

  OrdersListModel copyWith({
    List<Items>? items,
  }) =>
      OrdersListModel(
        items: items ?? this.items,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (items != null) {
      map['items'] = items?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
