import 'package:flutter/material.dart';
import 'package:minutemove/resources/google_sign_in.dart';
import 'package:provider/provider.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xFFF8BBD0),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(bottom: 40),
                child: Image.asset(
                  'assets/MMLogo.jpeg',
                  fit: BoxFit.contain,
                ),
              ),
              Container(
                margin: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(35),
                    border:
                        Border.all(color: const Color(0xFF14213D), width: 2.5)),
                child: OutlinedButton(
                  child: const Text(
                    "Create Order",
                    style: TextStyle(
                      color: const Color(0xFF14213D),
                      fontFamily: 'Oregano',
                      fontSize: 30,
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, "/new_orders");
                  },
                  style: OutlinedButton.styleFrom(
                      backgroundColor: Color(0xFFBDE0FE),
                      shape: const StadiumBorder(),
                      padding: const EdgeInsets.fromLTRB(35, 10, 35, 10)),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(35),
                    border:
                        Border.all(color: const Color(0xFF14213D), width: 2.5)),
                child: OutlinedButton(
                  child: const Text(
                    "Log Out",
                    style: TextStyle(
                      color: const Color(0xFF14213D),
                      fontFamily: 'Oregano',
                      fontSize: 30,
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).popUntil((route) => route.isFirst);
                    final provider = Provider.of<GoogleSignInProvider>(context,
                        listen: false);
                    provider.logout();
                  },
                  style: OutlinedButton.styleFrom(
                      backgroundColor: Color(0xFFBDE0FE),
                      shape: const StadiumBorder(),
                      padding: const EdgeInsets.fromLTRB(35, 10, 35, 10)),
                ),
              ),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(32.0),
          child: SizedBox(
            height: 69,
            width: 69,
            child: FloatingActionButton(
              child: Icon(Icons.help),
              foregroundColor: const Color(0xFF14213D),
              backgroundColor: const Color(0xFFBDE0FE),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                          backgroundColor: const Color(0xFFBDE0FE),
                          title: Text(
                            'About',
                            style: TextStyle(
                              fontFamily: 'Oregano',
                              fontWeight: FontWeight.bold,
                              fontSize: 35,
                            ),
                          ),
                          content: Text(
                            'Same day on demand intra-city courier and express delivery service in 60-90 minutes exactly when you need it. Place an order in our delivery app and system will find you the most suitable delivery partner nearby.',
                            style:
                                TextStyle(fontFamily: 'Oregano', fontSize: 20),
                          ),
                        ));
              },
            ),
          ),
        ),
      ),
    );
  }
}
