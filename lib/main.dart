import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:minutemove/homepage.dart';
import 'package:minutemove/resources/google_sign_in.dart';
import 'package:provider/provider.dart';

import 'active.dart';
import 'delivernow.dart';
import 'home.dart';
import 'login.dart';
import 'new_orders.dart';
import 'payment.dart';
import 'schedulelater.dart';
import 'signup.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ChangeNotifierProvider(
    create: (context) => GoogleSignInProvider(),
    child: MaterialApp(routes: {
      '/': (context) => HomePageMain(),
      '/login': (context) => Login(),
      '/signup': (context) => SignUp(),
      '/createorder': (context) => NewOrders(),
      '/payment': (context) => Payment(),
      '/active': (context) => Active(),
      '/delivernow': (context) => DeliverNow(),
      '/schedulelater': (context) => ScheduleLater(),
    }),
  ));
}
