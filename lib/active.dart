import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Active extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(100),
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Center(
                child: Text(
                  "ACTIVE",
                  style: TextStyle(
                    fontFamily: 'Oregano',
                    fontSize: 50,
                  ),
                ),
              )
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
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
        backgroundColor: const Color(0xFFF8BBD0),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
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
                    Navigator.pushNamed(context, "/createorder");
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
                    Navigator.pushNamed(context, "/createorder");
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
                  onPressed: () {
                    Navigator.pushNamed(context, "/createorder");
                  },
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
