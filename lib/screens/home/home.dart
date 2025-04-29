import 'package:flutter/material.dart';
import 'package:gift_idea/services/auth.dart';

class Home extends StatelessWidget {
  Home({super.key});
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }
}
