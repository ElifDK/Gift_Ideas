import 'package:flutter/material.dart';
import 'package:gift_idea/model/user.dart';
import 'package:gift_idea/screens/authenticate/authenticate.dart';
import 'package:gift_idea/screens/loading_page.dart';
import 'package:gift_idea/screens/home/home.dart';
import 'package:provider/provider.dart';

import 'error_page.dart';


class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<MyUser?>(context);
    if (user == null) {
      // Return Home or Authenticate
      return Authenticate();
    }
    else {
      return Home(uid: user.uid);
    }
  }
}