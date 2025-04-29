import 'package:flutter/material.dart';
import 'package:gift_idea/screens/home/gift_list.dart';
import 'package:gift_idea/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:gift_idea/services/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Home extends StatelessWidget {
  final String uid;
  Home({required this.uid, super.key});
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return StreamProvider<QuerySnapshot?>.value(
      value: DatabaseService(uid: uid).gifts,
      initialData: null,
      child: Scaffold(
        backgroundColor: Colors.amberAccent,
        appBar: AppBar(
          title: Text('Gift Ideas'),
          backgroundColor: Colors.orange,
          elevation: 0.0,
          actions: [TextButton(
          child: Row(
            children: [
              Icon(Icons.person),
              Text('Log Out')
            ],
          ),
          onPressed: () async {
            await _auth.signOut();
          })],
        ),
        body: GiftList(),
      ),
    );
  }
}
