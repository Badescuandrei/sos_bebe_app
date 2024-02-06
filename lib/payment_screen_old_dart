// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:stripe_android/stripe_android.dart';
import 'package:http/http.dart' as http;

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  Map<String, dynamic>? paymentIntent;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
            children: [
            Center(
              child: ElevatedButton(
                child: const Text(
                  'Pay NOW mothafuka',
                  style: TextStyle(color: Colors.black),
                ),
                onPressed: () async {
                  await makePayment();
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> makePayment() async {
    try {
      paymentIntent = await createPaymentIntent('10', 'USD');
      await Stripe.instance
          .initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: paymentIntent!['client_secret'],
          googlePay: const PaymentSheetGooglePay(testEnv: true, merchantCountryCode: '+40'),
          merchantDisplayName: 'Adnan',
        ),
      )
          .then(
        (value) {
          displayPaymentSheet();
        },
      );
    } catch (e, s) {
      print("exception:$e$s");
    }
  }

  displayPaymentSheet() async {
    try {
      await Stripe.instance.presentPaymentSheet().then(
        (value) {
          showDialog(
            context: context,
            builder: (_) => const AlertDialog(
              content: Column(children: [
                Row(
                  children: [Icon(Icons.check_circle, color: Colors.green), Text('Payment successful')],
                )
              ]),
            ),
          );
          paymentIntent = null;
        },
      ).onError((error, stackTrace) {
        print("Errors is: $error $stackTrace");
      });
    } on StripeException catch (e) {
      print("Error is: $e");
      showDialog(
          context: context,
          builder: (_) => const AlertDialog(
                content: Text("cancelled"),
              ));
    }
  }

  createPaymentIntent(String amount, String currency) async {
    try {
      Map<String, dynamic> body = {
        'amount': calculateAmount(amount),
        'currency': currency,
        'payment_method_types[]': 'card'
      };

      var response = await http.post(
        Uri.parse('https://api.stripe.com/v1/payment_intents'),
        headers: {
          'Authorization':
              'Bearer sk_test_51NiZpwCOKR6JfYKlvEkhMttEFW3kX2FRMIPcbtsMCG331C29cu5HJ2YO651ZE8fwiFSDfUpmifC4NE6VSMcPQQVw00h2kJPLG4',
          'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: body,
      );
      print("Payment Intent Body -> ${response.body.toString()}");
      return (jsonDecode(response.body));
    } catch (err) {
      print('error charging user: ${err.toString()}');
    }
  }
}

calculateAmount(String amount) {
  final calculatedAmount = (int.parse(amount) * 100);
  return calculatedAmount.toString();
}
