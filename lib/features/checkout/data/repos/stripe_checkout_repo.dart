import 'package:checkout_app/core/errors/failures.dart';
import 'package:checkout_app/features/checkout/data/models/payment_intent_input_model.dart';
import 'package:dartz/dartz.dart';

abstract class StripeCheckoutRepo {
  Future<Either<Failures, void>> makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel});
}
