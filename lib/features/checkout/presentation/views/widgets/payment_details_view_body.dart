import 'dart:developer';

import 'package:checkout_app/features/checkout/presentation/views/thanks_view.dart';
import 'package:flutter/material.dart';

import 'custom_button.dart';
import 'custom_credit_card.dart';
import 'payment_methods.dart';

class PaymentDetailsViewBody extends StatefulWidget {
  const PaymentDetailsViewBody({Key? key}) : super(key: key);

  @override
  State<PaymentDetailsViewBody> createState() => _PaymentDetailsViewBodyState();
}

class _PaymentDetailsViewBodyState extends State<PaymentDetailsViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        const SliverToBoxAdapter(child: PaymentMethods()),
        SliverToBoxAdapter(
          child: CustomCreditCard(
            formKey: formKey,
            autoValidateMode: autoValidateMode,
          ),
        ),
        SliverFillRemaining(
          hasScrollBody: false,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 24, left: 16, right: 16),
              child: CustomButton(
                text: 'Pay',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ThanksView(),
                    ),
                  );
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    log('hello');
                  } else {
                    autoValidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
