class Items {
  Items({
    this.name,
    this.quantity,
    this.price,
    this.currency,
  });

  Items.fromJson(dynamic json) {
    name = json['name'];
    quantity = json['quantity'];
    price = json['price'];
    currency = json['currency'];
  }

  String? name;
  num? quantity;
  String? price;
  String? currency;

  Items copyWith({
    String? name,
    num? quantity,
    String? price,
    String? currency,
  }) =>
      Items(
        name: name ?? this.name,
        quantity: quantity ?? this.quantity,
        price: price ?? this.price,
        currency: currency ?? this.currency,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['quantity'] = quantity;
    map['price'] = price;
    map['currency'] = currency;
    return map;
  }
}
