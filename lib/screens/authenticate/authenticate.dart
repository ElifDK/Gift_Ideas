import 'package:flutter/material.dart';
import 'package:gift_idea/screens/authenticate/register.dart';
import 'package:gift_idea/screens/authenticate/sign_in.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({super.key});

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignIn = true;
  void changeView() {
    setState(() => showSignIn = !showSignIn);
  }
  @override
  Widget build(BuildContext context) {
    return showSignIn?SignIn(changeView: changeView):Register(changeView: changeView);
  }
}
