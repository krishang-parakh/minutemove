import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Payment extends StatelessWidget {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
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
            Navigator.pushNamed(context, "/");
          }
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xFFF8BBD0),
        selectedItemColor: const Color.fromARGB(255, 20, 33, 61),
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
        backgroundColor: const Color.fromARGB(255, 20, 33, 61),
        centerTitle: true,
        title: const Text(
          "PAYMENT",
          style: TextStyle(
            fontFamily: 'Oregano',
            fontSize: 30,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.close,
              color: Colors.white,
            ),
            onPressed: () {
              // do something
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[],
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              "Order Summary:",
              style: TextStyle(
                  fontFamily: 'Oregano',
                  color: const Color(0xFF14213D),
                  fontSize: 30),
              textAlign: TextAlign.center,
            ),
            // Image.asset('assets/MMLogo.jpeg'),
            SizedBox(
              height: 20,
            ),
            RaisedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                        'You are using Cash for Payment, are you sure you want to proceed?'),
                  ),
                );
              },
              child: Text(
                '\u{20B9} Cash',
                style: TextStyle(
                    fontFamily: 'Oregano',
                    color: const Color(0xFF14213D),
                    fontSize: 30),
              ),
              color: const Color(0xFFBDE0FE),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              padding: EdgeInsets.only(left: 80, right: 80),
            ),
            SizedBox(
              height: 20,
            ),
            RaisedButton.icon(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                        'You are using Card for Payment, are you sure you want to proceed?'),
                  ),
                );
              },
              icon: Icon(Icons.camera_front),
              label: Text(
                'Card',
                style: TextStyle(
                    fontFamily: 'Oregano',
                    color: const Color(0xFF14213D),
                    fontSize: 30),
              ),
              color: const Color(0xFFBDE0FE),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              padding: EdgeInsets.only(left: 80, right: 80),
            )
          ],
        ),
      ),
    );
  }
}
