import 'package:flutter/material.dart';
import 'package:gift_idea/model/user.dart';
import 'package:gift_idea/screens/form_methods.dart';
import 'package:gift_idea/screens/loading_page.dart';
import 'package:gift_idea/services/database.dart';
import 'package:provider/provider.dart';

class SettingsForm extends StatefulWidget {
  const SettingsForm({super.key});

  @override
  State<SettingsForm> createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {

  final _formKey = GlobalKey<FormState>();
  String? _currentName;
  String? _currentWishOne;
  String? _currentWishTwo;
  String? _currentWishThree;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<MyUser?>(context);
    return StreamBuilder<MyUserData?>(
      stream: DatabaseService(uid: user!.uid).userData,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          MyUserData? userData = snapshot.data;
          return Form(
              key: _formKey,
              child: Stack(
                children: <Widget>[
                  Container(
                    decoration:  BoxDecoration(
                      image:  DecorationImage(image:  AssetImage("assets/genie.jpg"), fit: BoxFit.scaleDown, opacity: 0.2),
                    ),
                  ),
                  Center(
                    child: Column(
                      children: [
                        SizedBox(height: 100),
                        Text('Hello ${userData!.name}! You have three wishes!'),
                        SizedBox(height: 10),
                        TextFormField(initialValue: userData.wishOne,
                            decoration: buildInputDecoration(Icon(Icons.looks_one_outlined), 'First Wish'),
                            validator: (val) => val!.isEmpty ? 'Please enter your first wish': null,
                            onChanged: (val)=> setState(() => _currentWishOne = val)),
                        SizedBox(height: 10),
                        TextFormField(initialValue: userData.wishTwo,
                          decoration: buildInputDecoration(Icon(Icons.looks_two_outlined), 'Second Wish'),
                            validator: (val) => val!.isEmpty ? 'Please enter your second wish': null,
                            onChanged: (val)=> setState(() => _currentWishTwo = val)),
                        SizedBox(height: 10),
                        TextFormField(initialValue: userData.wishThree,
                          decoration: buildInputDecoration(Icon(Icons.looks_3_outlined), 'Third Wish'),
                            validator: (val) => val!.isEmpty ? 'Please enter your third wish': null,
                            onChanged: (val)=> setState(() => _currentWishThree = val)),
                        SizedBox(height: 10),
                        TextFormField(initialValue: userData.name,
                          decoration: buildInputDecoration(Icon(Icons.account_box_outlined), 'Nick Name'),
                            validator: (val) => val!.isEmpty ? 'Please enter your nick name': null,
                            onChanged: (val)=> setState(() => _currentName = val)),
                    SizedBox(height: 20),
                    ElevatedButton(onPressed: () async{
                      if(_formKey.currentState!.validate()){
                        await DatabaseService(uid: user.uid).updateUserData(
                            _currentName ?? userData.name,
                            _currentWishOne ?? userData.wishOne,
                            _currentWishTwo ?? userData.wishTwo,
                            _currentWishThree ?? userData.wishThree);
                      }
                    },
                    child: Text('Update'))
                      ],
                    ),
                  )
                ],
              )
          );
        }
        return LoadingPage();
      }
    );
  }
}
