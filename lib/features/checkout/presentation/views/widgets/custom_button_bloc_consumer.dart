import 'package:checkout_app/features/checkout/data/models/payment_intent_input_model.dart';
import 'package:checkout_app/features/checkout/presentation/manager/payment_stripe_cubit/payment_stripe_cubit.dart';
import 'package:checkout_app/features/checkout/presentation/views/widgets/thanks_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'custom_button.dart';

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
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errMessage),
            ),
          );
        }
      },
      builder: (context, state) {
        return CustomButton(
          onPressed: () {
            PaymentIntentInputModel paymentIntentInputModel =
                const PaymentIntentInputModel(amount: '100', currency: 'usd');
            BlocProvider.of<PaymentStripeCubit>(context)
                .makePayment(paymentIntentInputModel: paymentIntentInputModel);
          },
          isLoading: state is PaymentStripeLoading ? true : false,
          text: 'Continue',
        );
      },
    );
  }
}
