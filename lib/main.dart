import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
//import 'package:sos_bebe_app/intro_screen.dart';
//import  'package:sos_bebe_app/confirmare_servicii_screen.dart';
import  'package:sos_bebe_app/adauga_metoda_plata_screen.dart';
//import  'package:sos_bebe_app/payment_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey =
      'pk_test_51NiZpwCOKR6JfYKlesMUOOQJyJLVZPUPgsjQIBbTHDGXFD0ocGELdZ3uVPrJn4knnhsdhTkRVm9h1Ij3WUU8EEdg00MhGEEoPS';
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      //home: const IntroScreen(),
      //home: const ConfirmareServiciiScreen(),
      //home: const PaymentScreen(),
      home: const AdaugaMetodaPlataScreen(),
    );

  }
}
