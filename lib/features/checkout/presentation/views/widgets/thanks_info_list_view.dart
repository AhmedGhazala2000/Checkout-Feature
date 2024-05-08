import 'package:checkout_app/core/utils/app_styles.dart';
import 'package:checkout_app/features/checkout/data/models/order_info_model.dart';
import 'package:flutter/material.dart';

import 'payment_info_item.dart';

class ThanksInfoListView extends StatelessWidget {
  const ThanksInfoListView({Key? key}) : super(key: key);
  final List<PaymentInfoModel> listModel = const [
    PaymentInfoModel(title: "Date", value: "01/24/2023"),
    PaymentInfoModel(title: "Time", value: "10:15 AM"),
    PaymentInfoModel(title: "To", value: "Sam Louis"),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: listModel.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(top: 20),
          child: PaymentInfoItem(
            orderInfoModel: listModel[index],
            style: AppStyles.styleSemiBold18,
          ),
        );
      },
    );
  }
}
