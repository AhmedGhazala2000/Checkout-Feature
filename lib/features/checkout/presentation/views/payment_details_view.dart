import 'package:checkout_app/features/checkout/presentation/views/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

import 'widgets/payment_details_view_body.dart';

class PaymentDetailsView extends StatelessWidget {
  const PaymentDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: customAppBar(context, 'Payment Details'),
        body: const PaymentDetailsViewBody(),
      ),
    );
  }
}
