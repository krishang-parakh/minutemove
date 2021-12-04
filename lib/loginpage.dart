import 'package:flutter/material.dart';
import 'package:minutemove/resources/google_sign_in.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
                width: 30,
                margin: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(35),
                    border:
                        Border.all(color: const Color(0xFF14213D), width: 2.5)),
                child: OutlinedButton(
                  child: const Text(
                    "Log In",
                    style: TextStyle(
                        color: const Color(0xFF14213D),
                        fontFamily: 'Oregano',
                        fontSize: 30),
                  ),
                  onPressed: () {
                    final provider = Provider.of<GoogleSignInProvider>(context,
                        listen: false);
                    provider.googleLogin();
                  },
                  style: OutlinedButton.styleFrom(
                      backgroundColor: Color(0xFFBDE0FE),
                      shape: const StadiumBorder(),
                      padding: const EdgeInsets.fromLTRB(35, 10, 35, 10)),
                ),
              ),
              Container(
                width: 30,
                margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(35),
                    border:
                        Border.all(color: const Color(0xFF14213D), width: 2.5)),
                child: OutlinedButton(
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(
                        fontFamily: 'Oregano',
                        fontSize: 30,
                        color: Color.fromARGB(255, 20, 33, 61)),
                  ),
                  onPressed: () {
                    final provider = Provider.of<GoogleSignInProvider>(context,
                        listen: false);
                    provider.googleLogin();
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
      ),
    );
  }
}