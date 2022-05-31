import 'dart:convert';

import 'package:stripe_payment/stripe_payment.dart';
import 'package:http/http.dart' as http;

class OrderPaymentService {
  final int amount;
  final String url;

  OrderPaymentService({this.amount = 10, this.url = ''});

  static init() {
    StripePayment.setOptions(
      StripeOptions(
          publishableKey:
              'pk_test_51L58oXLpT93Q6T7WVmOIVCbp3KWfgBIlr0jO82VOHXmnEZthiXzcACniUQ0wOheBEvXf0EMkiAaOjwgzWyKjuulq00YQg4KzaG',
          androidPayMode: 'test',
          merchantId: 'test'),
    );
  }

  Future<PaymentMethod?> createPaymentMethod() async {
    print('The transaction amount to be charged is: $amount');

    PaymentMethod paymentMethod =
        await StripePayment.paymentRequestWithCardForm(
      CardFormPaymentRequest(),
    );

    return paymentMethod;
  }

  Future<void> processPayment(PaymentMethod paymentMethod) async {}
}
