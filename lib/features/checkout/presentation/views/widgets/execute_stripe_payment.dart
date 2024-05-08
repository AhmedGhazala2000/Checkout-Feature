import 'package:checkout_app/features/checkout/data/models/payment_intent_input_model.dart';
import 'package:checkout_app/features/checkout/presentation/manager/payment_stripe_cubit/payment_stripe_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void executeStripePayment(BuildContext context) {
  PaymentIntentInputModel paymentIntentInputModel =
      const PaymentIntentInputModel(amount: '100', currency: 'usd');
  BlocProvider.of<PaymentStripeCubit>(context)
      .makePayment(paymentIntentInputModel: paymentIntentInputModel);
}
