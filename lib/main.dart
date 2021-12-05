import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:minutemove/resources/google_sign_in.dart';
import 'package:provider/provider.dart';

import 'active.dart';
import 'completed.dart';
import 'home.dart';
import 'new_orders.dart';
import 'payment.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ChangeNotifierProvider(
    create: (context) => GoogleSignInProvider(),
    child: MaterialApp(debugShowCheckedModeBanner: false, routes: {
      '/': (context) => Home(),
      '/new_orders': (context) => NewOrders(),
      // '/payment': (context) => Payment(),
      '/active': (context) => Active(),
      '/completed': (context) => Completed(),
    }),
  ));
}
