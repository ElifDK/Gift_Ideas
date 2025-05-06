import 'package:flutter/material.dart';
import 'package:gift_idea/model/gift.dart';
import 'package:gift_idea/screens/home/gift_list.dart';
import 'package:gift_idea/screens/home/settings.dart';
import 'package:gift_idea/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:gift_idea/services/database.dart';

class Home extends StatelessWidget {
  final String uid;
  Home({required this.uid, super.key});
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {

    void _showSettings() {
      showModalBottomSheet(context: context, builder:(context) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 60),
          child: SettingsForm(),
        );
      }
      );
    }

    return StreamProvider<List<Gift>?>.value(
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
              }),
            TextButton(
                child: Row(
                  children: [
                    Icon(Icons.settings),
                    Text('Settings')
                  ],
                ),
                onPressed: ()=> _showSettings())
          ],
        ),
        body: GiftList(),
      ),
    );
  }
}
