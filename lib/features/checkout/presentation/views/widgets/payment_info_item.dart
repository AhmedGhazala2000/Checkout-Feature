import 'package:checkout_app/core/utils/app_styles.dart';
import 'package:checkout_app/features/checkout/data/models/order_info_model.dart';
import 'package:flutter/material.dart';

class PaymentInfoItem extends StatelessWidget {
  const PaymentInfoItem(
      {Key? key, required this.orderInfoModel, required this.style})
      : super(key: key);
  final PaymentInfoModel orderInfoModel;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          orderInfoModel.title,
          style: AppStyles.styleRegular18(),
        ),
        Text(
          orderInfoModel.value,
          style: style,
        ),
      ],
    );
  }
}
