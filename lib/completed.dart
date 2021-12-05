import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class Completed extends StatelessWidget {
  int _selectedIndex = 0;

  List list = [
    "Krishang",
    "Rohit",
    "Samriddhi",
    "Harsh",
    "Ishan",
    "Mehul",
    "Shubham",
    "Amish",
    "Riya",
    "Sparsh",
    "Hardik",
  ];

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
                  "COMPLETED",
                  style: TextStyle(
                    fontFamily: 'Oregano',
                    fontSize: 50,
                    color: Color(0xFFBDE0FE),
                  ),
                ),
              )
            ],
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
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SingleChildScrollView(
                  child: GFSearchBar(
                    searchList: list,
                    overlaySearchListItemBuilder: (dynamic item) => Container(
                      padding: const EdgeInsets.all(5),
                      child: Text(
                        item,
                        style: const TextStyle(fontSize: 18),
                      ),
                    ),
                    searchQueryBuilder: (query, list) => list.where((item) {
                      return item!
                          .toString()
                          .toLowerCase()
                          .contains(query.toLowerCase());
                    }).toList(),
                  ),
                ),
                Card(
                  margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
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
                                height: 20,
                                width: 55,
                                child: Icon(Icons.pin_drop)),
                            Text(
                              'pickup',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: const Color(0xFF14213D),
                                  fontFamily: 'Oregano',
                                  fontSize: 25),
                            ),
                            SizedBox(
                                height: 20,
                                width: 55,
                                child: Icon(Icons.pin_drop)),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
