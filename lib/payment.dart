import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Payment extends StatelessWidget {
  final documentId;
  Payment(this.documentId);
  int _selectedIndex = 0;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference orders = FirebaseFirestore.instance.collection('orders');

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
          "PAYMENT",
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: FutureBuilder(
            future: orders.doc(documentId).get(),
            builder: (BuildContext context,
                AsyncSnapshot<DocumentSnapshot> snapshot) {
              if (snapshot.hasError) {
                return Text("Something went wrong");
              }

              if (snapshot.hasData && !snapshot.data!.exists) {
                return Text("Document does not exist");
              }

              if (snapshot.connectionState == ConnectionState.done) {
                Map<String, dynamic> data =
                    snapshot.data!.data() as Map<String, dynamic>;
                return Column(
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Sender Name: ",
                          style: TextStyle(
                            fontFamily: 'Oregano',
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                        Text(
                          data['sender'],
                          style: TextStyle(
                            fontFamily: 'Oregano',
                            fontSize: 25,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Item: ",
                          style: TextStyle(
                            fontFamily: 'Oregano',
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                        Text(
                          data['item'],
                          style: TextStyle(
                            fontFamily: 'Oregano',
                            fontSize: 25,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Pickup Address: ",
                          style: TextStyle(
                            fontFamily: 'Oregano',
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                        Text(
                          data['pickup'],
                          style: TextStyle(
                            fontFamily: 'Oregano',
                            fontSize: 25,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Sender's Number: ",
                          style: TextStyle(
                            fontFamily: 'Oregano',
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                        Text(
                          data['pickupnumber'],
                          style: TextStyle(
                            fontFamily: 'Oregano',
                            fontSize: 25,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Receiver: ",
                          style: TextStyle(
                            fontFamily: 'Oregano',
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                        Text(
                          data['receiver'],
                          style: TextStyle(
                            fontFamily: 'Oregano',
                            fontSize: 25,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Drop Address: ",
                          style: TextStyle(
                            fontFamily: 'Oregano',
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                        Text(
                          data['drop'],
                          style: TextStyle(
                            fontFamily: 'Oregano',
                            fontSize: 25,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Receiver's Number: ",
                          style: TextStyle(
                            fontFamily: 'Oregano',
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                        Text(
                          data['dropnumber'],
                          style: TextStyle(
                            fontFamily: 'Oregano',
                            fontSize: 25,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Instructions/Requests: ",
                          style: TextStyle(
                            fontFamily: 'Oregano',
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                        Text(
                          data['instructions'],
                          style: TextStyle(
                            fontFamily: 'Oregano',
                            fontSize: 25,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Date and Time of Delivery: ",
                          style: TextStyle(
                            fontFamily: 'Oregano',
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      data['date_str'],
                      style: TextStyle(
                        fontFamily: 'Oregano',
                        fontSize: 25,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Please choose the mode of payment",
                      style: TextStyle(
                        fontFamily: 'Oregano',
                        fontSize: 30,
                      ),
                    ),
                    RaisedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            backgroundColor: const Color(0xFF14213D),
                            content: Text(
                              'Your Order is confirmed. Mode of payment: Cash on Delivery',
                              style: TextStyle(
                                color: Color(0xFFBDE0FE),
                              ),
                            ),
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
                            backgroundColor: const Color(0xFF14213D),
                            content: Text(
                              'Your Order is confirmed. Mode of payment: Card on Delivery',
                              style: TextStyle(
                                color: Color(0xFFBDE0FE),
                              ),
                            ),
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
                );
              }

              return Text("loading");
            },
          ),
        ),
      ),
    );
  }
}
