import 'package:checkout_app/core/functions/show_snack_bar.dart';
import 'package:checkout_app/features/checkout/presentation/manager/payment_stripe_cubit/payment_stripe_cubit.dart';
import 'package:checkout_app/features/checkout/presentation/views/widgets/execute_stripe_payment.dart';
import 'package:checkout_app/features/checkout/presentation/views/widgets/thanks_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'custom_button.dart';
import 'execute_paypal_payment.dart';

class CustomButtonBlocConsumer extends StatelessWidget {
  const CustomButtonBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentStripeCubit, PaymentStripeState>(
      listener: (context, state) {
        if (state is PaymentStripeSuccess) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) {
            return const ThanksView();
          }));
        } else if (state is PaymentStripeFailure) {
          Navigator.pop(context);
          showSnackBar(context, state.errMessage);
        }
      },
      builder: (context, state) {
        return CustomButton(
          onPressed: () {
            if (BlocProvider.of<PaymentStripeCubit>(context).currentIndex ==
                0) {
              executeStripePayment(context);
            } else {
              executePaypalPayment(context);
            }
          },
          isLoading: state is PaymentStripeLoading ? true : false,
          text: 'Continue',
        );
      },
    );
  }
}
