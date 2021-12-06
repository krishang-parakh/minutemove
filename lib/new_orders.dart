import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_field/date_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import './payment.dart';
import 'myaccount.dart';

// import 'package:intl/intl.dart';
class NewOrders extends StatelessWidget {
  CollectionReference orders = FirebaseFirestore.instance.collection('orders');
  int _selectedIndex = 0;
  String item = "";
  String sender = "";
  String receiver = "";
  String pickupadd = "";
  String pickupnum = "";
  String dropadd = "";
  String dropnum = "";
  String date_str = "";
  String instructions = "";
  final user = FirebaseAuth.instance.currentUser;
  DocumentReference documentReference =
      FirebaseFirestore.instance.collection('orders').doc();
  // List<String> orderDetails = List<String>.filled(8, "tmp", growable: true);

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> _key = new GlobalKey();
    bool validate = false;
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            new Align(
              alignment: FractionalOffset.bottomCenter,
            ),
            DrawerHeader(
              child: Text(
                'ORDERS',
                style: TextStyle(
                  fontFamily: 'Oregano',
                  fontSize: 35,
                  color: const Color.fromARGB(255, 20, 33, 61),
                ),
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
              title: Text('All Orders',
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
          "New Order",
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
          padding: const EdgeInsets.all(15),
          child: Form(
            autovalidate: validate,
            key: _key,
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
                  keyboardType: TextInputType.text,
                  onChanged: (value) {
                    sender = value;
                    // orderDetails[0] = value;
                  },
                  validator: (sender) {
                    if (sender!.isEmpty)
                      return "Name is required";
                    else
                      return null;
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
                  keyboardType: TextInputType.text,
                  onChanged: (value) {
                    item = value;
                    // orderDetails[1] = value;
                  },
                  validator: (value) {
                    if (value!.isEmpty)
                      return "Item is required";
                    else
                      return null;
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
                  keyboardType: TextInputType.text,
                  onChanged: (value) {
                    pickupadd = value;
                    // orderDetails[2] = value;
                  },
                  validator: (value) {
                    if (value!.isEmpty)
                      return "Pickup address is required";
                    else
                      return null;
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
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    pickupnum = value;
                    // orderDetails[3] = value;
                  },
                  validator: (value) {
                    if (value!.isEmpty)
                      return "Phone No  is required";
                    else if (value.length != 10)
                      return "Number must contain 10 digits";
                    else
                      return null;
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
                  keyboardType: TextInputType.text,
                  onChanged: (value) {
                    receiver = value;
                    // orderDetails[4] = value;
                  },
                  validator: (value) {
                    if (value!.isEmpty)
                      return "Receiver Name is required";
                    else
                      return null;
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
                  keyboardType: TextInputType.text,
                  onChanged: (value) {
                    dropadd = value;
                    // orderDetails[5] = value;
                  },
                  validator: (value) {
                    if (value!.isEmpty)
                      return "Drop address is required";
                    else
                      return null;
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
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    dropnum = value;
                    // orderDetails[6] = value;
                  },
                  validator: (value) {
                    if (value!.isEmpty)
                      return "Phone No  is required";
                    else if (value.length != 10)
                      return "Number must contain 10 digits";
                    else
                      return null;
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
                    // orderDetails[7] = value;
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
                  onDateSelected: (DateTime value) {
                    date_str = value.toString();
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                const SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                    onPressed: () async {
                      if (_key.currentState!.validate()) {
                        await documentReference
                            .set({
                              'sender': sender,
                              'item': item,
                              'pickup': pickupadd,
                              'pickupnumber': pickupnum,
                              'receiver': receiver,
                              'drop': dropadd,
                              'dropnumber': dropnum,
                              'date_str': date_str,
                              'instructions': instructions,
                              'user': user!.uid.toString(),
                              'order_id': documentReference.id,
                            })
                            .then((value) => print('Order added'))
                            .catchError((error) => print('Error Found'));
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  Payment(documentReference.id),
                            ));
                      }
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          const Color(0xFF14213D)),
                    ),
                    child: const Text(
                      'Confirm',
                      style: TextStyle(
                          fontFamily: 'Oregano',
                          fontSize: 25,
                          color: Color.fromARGB(255, 189, 224, 254)),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

String validateName(String value) {
  String pattern = r'(^[a-zA-Z,.\-]+$)';
  RegExp regExp = new RegExp(pattern);
  if (value.length == 0)
    return "Name is required";
  else if (!regExp.hasMatch(value))
    return "Name must contain alphabets only";
  else {
    return "null";
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
