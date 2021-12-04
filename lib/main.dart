import 'package:flutter/material.dart';

import 'active.dart';
import 'delivernow.dart';
import 'home.dart';
import 'login.dart';
import 'new_orders.dart';
import 'payment.dart';
import 'schedulelater.dart';
import 'signup.dart';

void main() => runApp(MaterialApp(routes: {
      '/': (context) => Home(),
      '/login': (context) => Login(),
      '/signup': (context) => SignUp(),
      '/createorder': (context) => NewOrders(),
      '/payment': (context) => Payment(),
      '/active': (context) => Active(),
      '/delivernow': (context) => DeliverNow(),
      '/schedulelater': (context) => ScheduleLater(),
    }));
