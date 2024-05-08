import 'package:checkout_app/features/checkout/data/models/payment_intent_input_model.dart';
import 'package:checkout_app/features/checkout/data/repos/stripe_checkout_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'payment_stripe_state.dart';

class PaymentStripeCubit extends Cubit<PaymentStripeState> {
  PaymentStripeCubit(this._checkoutRepo) : super(PaymentStripeInitial());
  final StripeCheckoutRepo _checkoutRepo;
  int currentIndex = 0;

  Future makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    emit(PaymentStripeLoading());
    var data = await _checkoutRepo.makePayment(
        paymentIntentInputModel: paymentIntentInputModel);
    data.fold(
        (failure) => emit(PaymentStripeFailure(errMessage: failure.errMessage)),
        (success) => emit(PaymentStripeSuccess()));
  }
}
