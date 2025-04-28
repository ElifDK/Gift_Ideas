import 'package:flutter/material.dart';
import 'package:gift_idea/screens/authenticate/authenticate.dart';
import 'package:gift_idea/screens/home/home.dart';


class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    // Return Home or Authenticate
    return Authenticate();
  }
}
