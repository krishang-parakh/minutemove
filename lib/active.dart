import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Active extends StatelessWidget {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Color(0xFFBDE0FE),
          ),
          backgroundColor: const Color.fromARGB(255, 20, 33, 61),
          centerTitle: true,
          title: const Text(
            "ACTIVE",
            style: TextStyle(
              fontFamily: 'Oregano',
              fontSize: 30,
              color: Color(0xFFBDE0FE),
            ),
          ),
        ),
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
        backgroundColor: const Color(0xFFF8BBD0),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(
                height: 50,
              ),
              Container(
                width: 35,
                height: 125,
                margin: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border:
                        Border.all(color: const Color(0xFF14213D), width: 2.5)),
                child: OutlinedButton.icon(
                  icon: Icon(
                    Icons.send_rounded,
                    color: const Color(0xFF14213D),
                    size: 35,
                  ),
                  label: Text(
                    "Send Package",
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
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(47)),
                      padding: const EdgeInsets.fromLTRB(35, 10, 35, 10)),
                ),
              ),
              Container(
                width: 35,
                height: 125,
                margin: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border:
                        Border.all(color: const Color(0xFF14213D), width: 2.5)),
                child: OutlinedButton.icon(
                  icon: Icon(
                    Icons.local_grocery_store,
                    color: const Color(0xFF14213D),
                    size: 35,
                  ),
                  label: Text(
                    "Buy From Store",
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
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(47)),
                      padding: const EdgeInsets.fromLTRB(35, 10, 35, 10)),
                ),
              ),
              Container(
                width: 35,
                height: 125,
                margin: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border:
                        Border.all(color: const Color(0xFF14213D), width: 2.5)),
                child: OutlinedButton.icon(
                  icon: Icon(
                    Icons.pin_drop,
                    color: const Color(0xFF14213D),
                    size: 35,
                  ),
                  label: Text(
                    "Track Order",
                    style: TextStyle(
                      color: const Color(0xFF14213D),
                      fontFamily: 'Oregano',
                      fontSize: 30,
                    ),
                  ),
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                      backgroundColor: Color(0xFFBDE0FE),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(47)),
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
