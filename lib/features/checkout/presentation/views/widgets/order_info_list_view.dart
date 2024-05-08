import 'package:checkout_app/core/utils/app_styles.dart';
import 'package:checkout_app/features/checkout/data/models/order_info_model.dart';
import 'package:flutter/material.dart';

import 'payment_info_item.dart';

class OrderInfoListView extends StatelessWidget {
  const OrderInfoListView({Key? key}) : super(key: key);
  final List<PaymentInfoModel> listModel = const [
    PaymentInfoModel(title: "Order Subtotal", value: r"$42.97"),
    PaymentInfoModel(title: "Discount", value: r"$0"),
    PaymentInfoModel(title: "Shipping", value: r"$8"),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: listModel.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(top: 3),
          child: PaymentInfoItem(
            orderInfoModel: listModel[index],
            style: AppStyles.styleRegular18,
          ),
        );
      },
    );
  }
}
