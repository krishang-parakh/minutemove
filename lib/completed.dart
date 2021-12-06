import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'listorders.dart';

class Completed extends StatefulWidget {
  @override
  State<Completed> createState() => _CompletedState();
}

class _CompletedState extends State<Completed> {
  final user = FirebaseAuth.instance.currentUser;
  int counter = 0;
  var orders;
  @override
  void initState() {
    super.initState();
    // var listoforders = ListOrders().getOrders(user!.uid.toString());
    // print(listoforders[0]);
  }

  @override
  Widget build(BuildContext context) {
    int _selectedIndex = 0;
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
          "Your Orders",
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
            onPressed: () {},
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Card(
            margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            color: const Color(0xFFBDE0FE),
            clipBehavior: Clip.antiAlias,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  leading: Icon(
                    Icons.history,
                    size: 50,
                    color: const Color(0xFF14213D),
                  ),
                  title: const Text(
                    'item',
                    style: TextStyle(fontSize: 35, fontFamily: 'Oregano'),
                  ),
                  subtitle: Text(
                    'receiver',
                    style: TextStyle(
                        color: const Color(0xFF14213D),
                        fontSize: 20,
                        fontFamily: 'Oregano'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                    children: [
                      SizedBox(
                          height: 20, width: 55, child: Icon(Icons.pin_drop)),
                      Text(
                        'pickup',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: const Color(0xFF14213D),
                            fontFamily: 'Oregano',
                            fontSize: 25),
                      ),
                      SizedBox(
                          height: 20, width: 55, child: Icon(Icons.pin_drop)),
                      Text(
                        'drop',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: const Color(0xFF14213D),
                            fontFamily: 'Oregano',
                            fontSize: 25),
                      ),
                    ],
                  ),
                ),
                ButtonBar(
                  alignment: MainAxisAlignment.start,
                  children: [
                    FlatButton(
                      color: const Color(0xFF14213D),
                      onPressed: () {
                        // Perform some action
                      },
                      child: const Text(
                        'pickupnumber',
                        style: TextStyle(color: const Color(0xFFBDE0FE)),
                      ),
                    ),
                    FlatButton(
                      color: const Color(0xFF14213D),
                      onPressed: () {
                        // Perform some action
                      },
                      child: const Text(
                        'dropnumber',
                        style: TextStyle(color: const Color(0xFFBDE0FE)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
    throw UnimplementedError();
  }
}
