import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:minutemove/resources/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'active.dart';
import 'completed.dart';
import 'homepage.dart';
import 'new_orders.dart';
import 'payment.dart';
import 'myaccount.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ChangeNotifierProvider(
    create: (context) => GoogleSignInProvider(),
    child: MaterialApp(debugShowCheckedModeBanner: false, routes: {
      '/': (context) => HomePageMain(),
      '/new_orders': (context) => NewOrders(),
      '/myaccount': (context) => Myaccount(),
      '/active': (context) => Active(),
      '/completed': (context) => Completed(),
    }),
  ));
}
