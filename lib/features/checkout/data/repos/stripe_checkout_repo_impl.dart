import 'dart:developer';

import 'package:checkout_app/core/errors/failures.dart';
import 'package:checkout_app/core/utils/stripe_services.dart';

import 'package:checkout_app/features/checkout/data/models/payment_intent_input_model.dart';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

import 'stripe_checkout_repo.dart';

class StripeCheckoutRepoImpl extends StripeCheckoutRepo {
  final StripeServices stripeServices;

  StripeCheckoutRepoImpl({required this.stripeServices});

  @override
  Future<Either<Failures, void>> makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    try {
      await stripeServices.makePayment(
        paymentIntentInputModel: paymentIntentInputModel,
      );
      return right(null);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioException(dioException: e));
    } on StripeException catch (e) {
      return left(StripeFailure.fromStripeException(stripeException: e));
    } catch (e) {
      log(e.toString());
      return left(ServerFailure(errMessage: e.toString()));
    }
  }
}
