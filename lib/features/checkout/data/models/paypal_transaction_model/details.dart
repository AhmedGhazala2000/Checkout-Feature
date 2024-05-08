class Details {
  Details({
    required this.subtotal,
    required this.shipping,
    required this.shippingDiscount,
  });

  Details.fromJson(dynamic json) {
    subtotal = json['subtotal'];
    shipping = json['shipping'];
    shippingDiscount = json['shipping_discount'];
  }

  String? subtotal;
  String? shipping;
  num? shippingDiscount;

  Details copyWith({
    String? subtotal,
    String? shipping,
    num? shippingDiscount,
  }) =>
      Details(
        subtotal: subtotal ?? this.subtotal,
        shipping: shipping ?? this.shipping,
        shippingDiscount: shippingDiscount ?? this.shippingDiscount,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['subtotal'] = subtotal;
    map['shipping'] = shipping;
    map['shipping_discount'] = shippingDiscount;
    return map;
  }
}
