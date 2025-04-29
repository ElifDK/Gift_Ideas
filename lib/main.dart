import 'package:flutter/material.dart';
import 'package:gift_idea/model/user.dart';
import 'package:gift_idea/screens/authenticate/error_page.dart';
import 'package:gift_idea/screens/authenticate/loading_page.dart';
import 'package:gift_idea/screens/wrapper.dart';
import 'package:gift_idea/services/auth.dart';
import 'package:provider/provider.dart';

// Import the firebase_core plugin
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        // Initialize FlutterFire
        future: Firebase.initializeApp(),
        builder: (context, snapshot) {
          // Check for errors
          if (snapshot.hasError) {
            return MaterialApp(
                home:ErrorPage(errorDetail: "Firebase App could not be initialized!",));
          }

          // Once complete, show your application
          if (snapshot.connectionState == ConnectionState.done) {
            return StreamProvider<MyUser?>.value(
                value:AuthService().user,
                initialData: null,
                child: MaterialApp(
                home:Wrapper()));
          }

          // Otherwise, show something whilst waiting for initialization to complete
          return MaterialApp(
              home:LoadingPage());
        },
      );
  }
}
