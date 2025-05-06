import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gift_idea/model/gift.dart';
import 'package:gift_idea/model/user.dart';

class DatabaseService {

  final String uid;

  DatabaseService({required this.uid});

  // collection reference
  final CollectionReference giftCollection = FirebaseFirestore.instance
      .collection('gifts');

  Future updateUserData(String name, String wishOne, String wishTwo,
      String wishThree) async {
    return await giftCollection.doc(uid).set({
      'name': name,
      'wishOne': wishOne,
      'wishTwo': wishTwo,
      'wishThree': wishThree,
    });
  }

  // gift list from snapshot
  List<Gift> _giftListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Gift(
        name: doc['name'] ?? '',
        wishOne: doc['wishOne'] ?? '',
        wishTwo: doc['wishTwo'] ?? '',
        wishThree: doc['wishThree'] ?? '',
      );
    }).toList();
  }

  // get gifts stream
  Stream<List<Gift>> get gifts {
    return giftCollection.snapshots()
        .map(_giftListFromSnapshot);
  }

// user Data from snapshot

  MyUserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return MyUserData(uid: uid,
        name: snapshot['name'],
        wishOne: snapshot['wishOne'],
        wishTwo: snapshot['wishTwo'],
        wishThree: snapshot['wishThree']);
  }



// get user doc stream
  Stream<MyUserData> get userData {
    return giftCollection.doc(uid).snapshots().map(_userDataFromSnapshot);
  }
}