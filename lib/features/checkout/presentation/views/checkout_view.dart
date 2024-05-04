import 'package:checkout_app/features/checkout/presentation/views/widgets/checkout_view_body.dart';
import 'package:checkout_app/features/checkout/presentation/views/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: customAppBar(context, "My Cart"),
        body: const CheckoutViewBody(),
      ),
    );
  }
}
