import 'package:flutter/material.dart';
import 'package:gift_idea/services/auth.dart';
import 'package:email_validator/email_validator.dart';

class Register extends StatefulWidget {
  final Function changeView;
  Register({required this.changeView, super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  // text field state
  String email = '';
  String password = '';
  String error = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.amberAccent,
        appBar: AppBar(
          backgroundColor: Colors.orange,
          elevation: 0.0,
          title: Text ('Sign Up'),
          actions: [
            TextButton(
                child: Row(
                  children: [
                    Icon(Icons.person),
                    Text('Sign In')
                  ],
                ),
                onPressed: () {
                  widget.changeView();
                })
          ],
        ),
        body: Form(
          key: _formKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    label: SizedBox(
                      width: 100,
                      child: Row(
                        children: [Icon(Icons.email), Text('Email')],
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                      ),
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  validator: (value) {
                    if (value != null) {
                      if (value.isEmpty) {
                        return 'Cannot leave e-mail empty';
                      }
                      if (!EmailValidator.validate(value)) {
                        return 'Not a valid email';
                      }
                    }

                  },
                  onChanged: (value) {
                    setState(() {
                      email = value ?? '';
                    });

                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  autocorrect: false,
                  enableSuggestions: false,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    label: SizedBox(
                      width: 150,
                      child: Row(
                        children: [Icon(Icons.password), Text('Password')],
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                      ),
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  validator: (value) {
                    if (value != null) {
                      if (value.isEmpty) {
                        return 'Cannot leave password empty';
                      }
                      if (value.length < 6) {
                        return 'You need to enter at least 6 chars';
                      }
                    }
                  },
                  onChanged: (value) {
                    setState(() {
                      password = value ?? '';
                    });
                  },
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(onPressed: () async{
                if (_formKey.currentState!.validate()){
                  dynamic result = await _auth.registerEmailPass(email, password);
                  if (result == null) {
                    setState(() {
                      error = 'Something went wrong!';
                    });
                  }
                  else {
                    print ('Success');
                  }
                }
              },
                  child: Text('Register')),
              SizedBox(height: 12,),
              Text(error,style: TextStyle(color:Colors.red),)

            ],
          ),
        )
    );
  }
}
