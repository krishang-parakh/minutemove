import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      backgroundColor: const Color(0xFFF8BBD0),
      resizeToAvoidBottomInset: false,
      body: Center(
        child: SingleChildScrollView(
          child: IntrinsicWidth(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  child: Image.asset(
                    'assets/MMLogo.jpeg',
                    fit: BoxFit.contain,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 75, vertical: 10),
                  child: TextField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      fillColor: Color(0xFFBDE0FE),
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: const Color(0xFF14213D),
                        ),
                        borderRadius: BorderRadius.circular(35),
                      ),
                      hintStyle: TextStyle(
                          fontSize: 25,
                          color: const Color(0xFF14213D),
                          fontFamily: 'Oregano'),
                      hintText: 'Name',
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 75, vertical: 10),
                  child: TextField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      fillColor: Color(0xFFBDE0FE),
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: const Color(0xFF14213D),
                        ),
                        borderRadius: BorderRadius.circular(35),
                      ),
                      hintStyle: TextStyle(
                          fontSize: 25,
                          color: const Color(0xFF14213D),
                          fontFamily: 'Oregano'),
                      hintText: 'Email ID',
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 75, vertical: 10),
                  child: TextField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      fillColor: Color(0xFFBDE0FE),
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: const Color(0xFF14213D),
                        ),
                        borderRadius: BorderRadius.circular(35),
                      ),
                      hintStyle: TextStyle(
                          fontSize: 25,
                          color: const Color(0xFF14213D),
                          fontFamily: 'Oregano'),
                      hintText: 'Password',
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(125, 10, 125, 0),
                  child: OutlinedButton(
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(
                          color: const Color(0xFFBDE0FE),
                          fontFamily: 'Oregano',
                          fontSize: 15),
                    ),
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                        backgroundColor: Color(0xFF14213D),
                        shape: const StadiumBorder(),
                        padding: const EdgeInsets.fromLTRB(5, 10, 5, 10)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
