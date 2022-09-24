import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:email_validator/email_validator.dart';
import 'package:sample_app/presentation/auth/signup_page.dart';

import '../../../main.dart';

class LoginBottomSheet extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();

  LoginBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          decoration: new BoxDecoration(
            //color: forDialog ? Color(0xFF737373) : Colors.white,
              borderRadius: new BorderRadius.only(
                  topLeft: const Radius.circular(25.0),
                  topRight: const Radius.circular(25.0))),
        ),
        Align(
          alignment: Alignment(1, -1),
          // ignore: unnecessary_new
          child: new IconButton(
            icon: new Icon(Icons.close),
            onPressed: () => Navigator.of(context).pop(null),
          ),
        ),
        Align(
            alignment: Alignment(-1, -0.75),
            child: Text("Login to your account",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold))),
        Align(
            alignment: Alignment(-1, -0.65),
            child: Text("Email Address",
                style: TextStyle(fontSize: 10, color: Colors.grey))),
        Align(
          alignment: Alignment(-1, -0.55),
          child: TextFormField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(labelText: 'Email'),
            controller: _emailController,
          ),
        ),
        Align(
            alignment: Alignment(-1, -0.35),
            child: Text("Password",
                style: TextStyle(fontSize: 10, color: Colors.grey))),
        Align(
          alignment: Alignment(-1, -0.25),
          child: TextField(
            obscureText: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Password',
              hintText: 'Enter Password',
            ),
          ),
        ),
        Align(
          alignment: Alignment(0, -0.05),
          child: FloatingActionButton.extended(
            extendedPadding:
            EdgeInsets.only(left: 100, right: 100, top: 20, bottom: 20),
            label: Text('LOGIN'),
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
            onPressed: () {
              final _isValid = EmailValidator.validate(_emailController.text);
              if (_isValid) {
                Fluttertoast.showToast(
                    msg: "Valid Email",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.TOP,
                    timeInSecForIosWeb: 1,
                    fontSize: 16.0);
              } else if (_emailController.text.isEmpty) {
                Fluttertoast.showToast(
                    msg: 'Enter Email',
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.TOP,
                    timeInSecForIosWeb: 1,
                    fontSize: 16.0);
              } else {
                Fluttertoast.showToast(
                    msg: 'Enter a Valid Email',
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.TOP,
                    timeInSecForIosWeb: 1,
                    fontSize: 16.0);
              }
            },
          ),
        ),
        Align(
            alignment: Alignment(0, 0.05),
            child: Text("Forgot Password",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue))),
        Align(
            alignment: Alignment(0, 0.15),
            child: Text(
                "---------------------------------------or---------------------------------",
                style: TextStyle(fontSize: 10, color: Colors.grey))),
        Align(
          alignment: Alignment(0, 0.25),
          child: ElevatedButton(
            child: const Text('Sign in with Apple'),
            onPressed: null,
          ),
        ),
        Align(
          alignment: Alignment(0, 0.35),
          child: ElevatedButton(
            child: const Text('Sign in with Google'),
            onPressed: null,
          ),
        ),
        Align(
          alignment: Alignment(0, 0.45),
          child: ElevatedButton(
            child: const Text('Sign in with Facebook'),
            onPressed: null,
          ),
        ),
        Align(
            alignment: Alignment(0, 0.9),
            child: FloatingActionButton.extended(
                extendedPadding:
                EdgeInsets.only(left: 100, right: 100, top: 20, bottom: 20),
                label: Text('SIGN UP NOW'),
                backgroundColor: Colors.white,
                foregroundColor: Colors.blue,
                onPressed: () {
                  showModalBottomSheet<dynamic>(
                      isScrollControlled: true,
                      context: context,
                      builder: (BuildContext bc) {
                      return SignupPage();
    });
    },)),
      ],
    );
  }
}
