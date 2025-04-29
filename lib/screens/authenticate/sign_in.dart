import 'package:flutter/material.dart';
import 'package:gift_idea/screens/authenticate/error_page.dart';
import 'package:gift_idea/services/auth.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      appBar: AppBar(
        backgroundColor: Colors.orange,
        elevation: 0.0,
        title: Text ('Sign In'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
        child: ElevatedButton(onPressed: () async {
          dynamic result =  await _auth.signInAnon();
          if (result == null) {
              Navigator.push( context, MaterialPageRoute(builder: (context) => ErrorPage(errorDetail: "Error Signing In")), );

            //print ('Error signing in');
          }
          else {
            print ('Signed in');
            print(result.uid);
          }
        }, child: Text('Sign in Anon'))
      )
    );
  }
}
