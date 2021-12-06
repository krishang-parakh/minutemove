import 'package:cloud_firestore/cloud_firestore.dart';

class ListOrders {
  CollectionReference orders = FirebaseFirestore.instance.collection('orders');
  Future getOrders(String uid) async {
    return await FirebaseFirestore.instance
        .collection('orders')
        .where('user', isEqualTo: uid)
        .get();
  }
}
