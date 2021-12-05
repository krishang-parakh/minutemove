import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class NewOrders extends StatelessWidget {
  CollectionReference orders = FirebaseFirestore.instance.collection('orders');
  int _selectedIndex = 0;
  late String item;
  late String sender;
  late String receiver;
  late String pickupadd;
  late String pickupnum;
  late String dropadd;
  late String dropnum;
  late String datetime;
  late String instructions;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: const Color(0xFFBDE0FE),
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            new Align(
              alignment: FractionalOffset.bottomCenter,
            ),
            DrawerHeader(
              child: Text(
                'ORDERS',
                style: TextStyle(fontFamily: 'Oregano', fontSize: 35),
              ),
              decoration: BoxDecoration(
                color: const Color(0xFFF8BBD0),
              ),
            ),
            ListTile(
              title: Text('Active',
                  style: TextStyle(fontFamily: 'Oregano', fontSize: 25)),
              tileColor: const Color(0xFFBDE0FE),
              onTap: () {
                Navigator.pushNamed(context, "/active");
              },
            ),
            ListTile(
              title: Text('Completed',
                  style: TextStyle(fontFamily: 'Oregano', fontSize: 25)),
              tileColor: const Color(0xFFBDE0FE),
              onTap: () {
                Navigator.pushNamed(context, "/completed");
              },
            ),
          ],
        ),
      ),
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
      body: SingleChildScrollView(
        child: Padding(
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
                      elevation: 15,
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
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                "We will assign the nearest courier to pick-up and deliver as soon as possible.",
                style: TextStyle(
                    fontFamily: 'Oregano',
                    color: Colors.blueGrey,
                    fontSize: 25),
                textAlign: TextAlign.center,
              ),
              TextFormField(
                onChanged: (value) {
                  sender = value;
                },
                style: TextStyle(
                    fontFamily: 'Oregano',
                    color: const Color(0xFF14213D),
                    fontSize: 20),
                decoration: const InputDecoration(
                  hintStyle: TextStyle(
                      fontFamily: 'Oregano',
                      color: const Color(0xFF14213D),
                      fontSize: 15),
                  labelStyle: TextStyle(
                      fontFamily: 'Oregano',
                      color: const Color(0xFF14213D),
                      fontSize: 25),
                  icon: Icon(Icons.flight_takeoff_sharp,
                      color: const Color(0xFF14213D), size: 35),
                  hintText: 'Sender Name',
                  labelText: 'Sender Name',
                ),
              ),
              TextFormField(
                onChanged: (value) {
                  item = value;
                },
                style: TextStyle(
                    fontFamily: 'Oregano',
                    color: const Color(0xFF14213D),
                    fontSize: 20),
                decoration: const InputDecoration(
                  hintStyle: TextStyle(
                      fontFamily: 'Oregano',
                      color: const Color(0xFF14213D),
                      fontSize: 20),
                  labelStyle: TextStyle(
                      fontFamily: 'Oregano',
                      color: const Color(0xFF14213D),
                      fontSize: 25),
                  icon: Icon(Icons.card_giftcard,
                      color: const Color(0xFF14213D), size: 35),
                  hintText: 'Item Name',
                  labelText: 'Item Name',
                ),
              ),
              TextFormField(
                onChanged: (value) {
                  pickupadd = value;
                },
                maxLines: 2,
                style: TextStyle(
                    fontFamily: 'Oregano',
                    color: const Color(0xFF14213D),
                    fontSize: 20),
                decoration: const InputDecoration(
                  hintStyle: TextStyle(
                      fontFamily: 'Oregano',
                      color: const Color(0xFF14213D),
                      fontSize: 20),
                  labelStyle: TextStyle(
                      fontFamily: 'Oregano',
                      color: const Color(0xFF14213D),
                      fontSize: 25),
                  icon: Icon(Icons.pin_drop,
                      color: const Color(0xFF14213D), size: 35),
                  hintText: 'Pickup Address',
                  labelText: 'Enter the Pickup Address',
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                onChanged: (value) {
                  pickupnum = value;
                },
                style: TextStyle(
                    fontFamily: 'Oregano',
                    color: const Color(0xFF14213D),
                    fontSize: 20),
                decoration: const InputDecoration(
                  hintStyle: TextStyle(
                      fontFamily: 'Oregano',
                      color: const Color(0xFF14213D),
                      fontSize: 20),
                  labelStyle: TextStyle(
                      fontFamily: 'Oregano',
                      color: const Color(0xFF14213D),
                      fontSize: 25),
                  icon: Icon(Icons.phone,
                      color: const Color(0xFF14213D), size: 35),
                  hintText: 'Phone number of sender',
                  labelText: 'Phone',
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                onChanged: (value) {
                  receiver = value;
                },
                style: TextStyle(
                    fontFamily: 'Oregano',
                    color: const Color(0xFF14213D),
                    fontSize: 20),
                decoration: const InputDecoration(
                  hintStyle: TextStyle(
                      fontFamily: 'Oregano',
                      color: const Color(0xFF14213D),
                      fontSize: 20),
                  labelStyle: TextStyle(
                      fontFamily: 'Oregano',
                      color: const Color(0xFF14213D),
                      fontSize: 25),
                  icon: Icon(Icons.flight_land_sharp,
                      color: const Color(0xFF14213D), size: 35),
                  hintText: 'Receivers Name',
                  labelText: 'Receivers Name',
                ),
              ),
              TextFormField(
                onChanged: (value) {
                  dropadd = value;
                },
                maxLines: 2,
                style: TextStyle(
                    fontFamily: 'Oregano',
                    color: const Color(0xFF14213D),
                    fontSize: 20),
                decoration: const InputDecoration(
                  hintStyle: TextStyle(
                      fontFamily: 'Oregano',
                      color: const Color(0xFF14213D),
                      fontSize: 20),
                  labelStyle: TextStyle(
                      fontFamily: 'Oregano',
                      color: const Color(0xFF14213D),
                      fontSize: 25),
                  icon: Icon(Icons.pin_drop,
                      color: const Color(0xFF14213D), size: 35),
                  hintText: 'Drop Address',
                  labelText: 'Enter the Drop Address',
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                onChanged: (value) {
                  dropnum = value;
                },
                style: TextStyle(
                    fontFamily: 'Oregano',
                    color: const Color(0xFF14213D),
                    fontSize: 20),
                decoration: const InputDecoration(
                  hintStyle: TextStyle(
                      fontFamily: 'Oregano',
                      color: const Color(0xFF14213D),
                      fontSize: 20),
                  labelStyle: TextStyle(
                      fontFamily: 'Oregano',
                      color: const Color(0xFF14213D),
                      fontSize: 25),
                  icon: Icon(Icons.phone,
                      color: const Color(0xFF14213D), size: 35),
                  hintText: 'Phone number of recipient',
                  labelText: 'Phone number of recipient',
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                onChanged: (value) {
                  instructions = value;
                },
                maxLines: 3,
                style: TextStyle(
                    fontFamily: 'Oregano',
                    color: const Color(0xFF14213D),
                    fontSize: 20),
                decoration: const InputDecoration(
                  hintStyle: TextStyle(
                      fontFamily: 'Oregano',
                      color: const Color(0xFF14213D),
                      fontSize: 20),
                  labelStyle: TextStyle(
                      fontFamily: 'Oregano',
                      color: const Color(0xFF14213D),
                      fontSize: 25),
                  icon: Icon(Icons.checklist,
                      color: const Color(0xFF14213D), size: 35),
                  hintText: 'Instructions/Requests',
                  labelText: 'Instructions/Requests',
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              DateTimeFormField(
                decoration: const InputDecoration(
                  hintStyle: TextStyle(
                      fontFamily: 'Oregano',
                      color: const Color(0xFF14213D),
                      fontSize: 20),
                  labelStyle: TextStyle(
                      fontFamily: 'Oregano',
                      color: const Color(0xFF14213D),
                      fontSize: 30),
                  errorStyle: TextStyle(color: Colors.redAccent),
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.event_note,
                      color: const Color(0xFF14213D), size: 35),
                  labelText: 'Enter pickup date and time  ',
                ),
                mode: DateTimeFieldPickerMode.dateAndTime,
                autovalidateMode: AutovalidateMode.always,
                validator: (e) =>
                    (e?.day ?? 0) == 1 ? 'Please not the first day' : null,
                onDateSelected: (DateTime value) {},
              ),
              const SizedBox(
                height: 15,
              ),
              const SizedBox(
                height: 15,
              ),
              ElevatedButton(
                  onPressed: () async {
                    await orders
                        .add({
                          'sender': sender,
                          'item': item,
                          'pickup': pickupadd,
                          'pickupnumber': pickupnum,
                          'receiver': receiver,
                          'drop': dropadd,
                          'dropnumber': dropnum,
                          'instructions': instructions,
                          'datetime': datetime,
                        })
                        .then((value) => print('Order added'))
                        .catchError((error) => print('Error Found'));
                    Navigator.pushNamed(context, "/payment");
                  },
                  child: const Text(
                    'Confirm',
                    style: TextStyle(fontFamily: 'Oregano', fontSize: 25),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
//
// class _SFWidgetState extends State <NewOrdersSF> {
//   int _selectedIndex = 0;
//
//   void _OnItemTap(int Index) {
//     setState(() {
//       _selectedIndex = Index})
//   });
// }
