import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService{

  final String uid;
  DatabaseService ({required this.uid});
  // collection reference
  final CollectionReference giftCollection = FirebaseFirestore.instance.collection('gifts');

  Future updateUserData (String name, String wishOne, String wishTwo, String wishThree) async {
    return await giftCollection.doc(uid).set({
      'name': name,
      'wishOne': wishOne,
      'wishTwo': wishTwo,
      'wishThree': wishThree,
    });

  }

  // get gifts stream
Stream<QuerySnapshot> get gifts {
    return giftCollection.snapshots();
}
}