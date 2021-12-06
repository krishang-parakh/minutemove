import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:minutemove/resources/google_sign_in.dart';
import 'package:provider/provider.dart';

class Myaccount extends StatelessWidget {
  int _selectedIndex = 0;
  final user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    // final photourl = user!.photoURL;
    return Scaffold(
      backgroundColor: const Color(0xFFF8BBD0),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (int index) {
          if (index == 0) {
            Navigator.pushNamed(context, "/");
          } else if (index == 1) {
            Navigator.pushNamed(context, "/new_orders");
          } else {
            Navigator.pushNamed(context, "/myaccount");
          }
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color.fromARGB(255, 20, 33, 61),
        selectedItemColor: const Color(0xFFF8BBD0),
        unselectedItemColor: const Color(0xFFF8BBD0),
        selectedFontSize: 13,
        unselectedFontSize: 13,
        iconSize: 30,
        items: const [
          BottomNavigationBarItem(
            label: "Home",
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: "New Order",
            icon: Icon(Icons.add_circle_outline),
          ),
          BottomNavigationBarItem(
            label: "My Account",
            icon: Icon(Icons.account_circle_outlined),
          ),
        ],
      ),
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Color(0xFFBDE0FE),
        ),
        backgroundColor: const Color.fromARGB(255, 20, 33, 61),
        centerTitle: true,
        title: const Text(
          "MY ACCOUNT",
          style: TextStyle(
            fontFamily: 'Oregano',
            fontSize: 30,
            color: Color(0xFFBDE0FE),
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.close,
              color: Color(0xFFBDE0FE),
            ),
            onPressed: () {
              // do something
            },
          )
        ],
      ),
      body: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 60,
                backgroundImage: NetworkImage(user!.photoURL.toString()),
              ),
              SizedBox(height: 16),
              Text("Name: " + user!.displayName.toString(),
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF14213D),
                    fontFamily: 'Oregano',
                  )),
              SizedBox(height: 16),
              Text("Email: " + user!.email.toString(),
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF14213D),
                    fontFamily: 'Oregano',
                  )),
              SizedBox(height: 16),
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
          )),
    );
  }
}
