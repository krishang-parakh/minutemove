import 'package:flutter/material.dart';

class DeliverNow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8BBD0),
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
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 20, 33, 61),
        centerTitle: true,
        title: const Text(
          "New Order",
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
            onPressed: () {},
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: const Color.fromARGB(255, 189, 224, 254),
                    onPrimary: const Color.fromARGB(255, 20, 33, 61),
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    minimumSize: const Size(50, 75),
                  ),
                  onPressed: () {},
                  child: const Text(
                    'Deliver Now',
                    style: TextStyle(fontFamily: 'Oregano', fontSize: 25),
                  ),
                ),
                const Icon(
                  Icons.access_alarm_outlined,
                  size: 35,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: const Color.fromARGB(255, 189, 224, 254),
                    onPrimary: const Color.fromARGB(255, 20, 33, 61),
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    minimumSize: const Size(50, 75),
                  ),
                  onPressed: () {},
                  child: const Text(
                    'Schedule for Later',
                    style: TextStyle(fontFamily: 'Oregano', fontSize: 25),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              "We will assign the nearest courier to pick-up and deliver as soon as possible.",
              style: TextStyle(
                  fontFamily: 'Oregano', color: Colors.blueGrey, fontSize: 25),
              textAlign: TextAlign.center,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/payment");
                },
                child: Text('Confirm'))
          ],
        ),
      ),
    );
  }
}
