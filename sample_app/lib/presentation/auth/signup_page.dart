import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sample_app/presentation/auth/create_your_acount_page.dart';
import 'package:sample_app/presentation/core/widgets/app_input_field.dart';


import '../../../main.dart';

bool _isValid = false;
class SignupPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();

  SignupPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Stack(children: <Widget>[
          Align(
            alignment: Alignment(1, -1),
            // ignore: unnecessary_new
            child: new IconButton(
              icon: new Icon(Icons.close),
              onPressed: () => Navigator.of(context).pop(null),
            ),
          ),
          Align(
              alignment: Alignment(-1, -0.8),
              child: Text("Signup to create an acount",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold))),
          Align(
              alignment: Alignment(-1, -0.7),
              child: Text("Email Address",
                  style: TextStyle(fontSize: 10, color: Colors.grey))),
          Align(
            alignment: Alignment(-1, -0.55),
            child: AppInputField(
              controller: _emailController,
              label: 'Enter email address',
            ),
          ),
          Align(
            alignment: Alignment(0, -0.3),
            child: FloatingActionButton.extended(
              extendedPadding:
              EdgeInsets.only(left: 100, right: 100, top: 20, bottom: 20),
              label: Text('SIGN UP'),
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              onPressed: () {
                _isValid = EmailValidator.validate(_emailController.text);
                if (_isValid) {
                  Fluttertoast.showToast(
                      msg: "Valid Email",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.TOP,
                      timeInSecForIosWeb: 1,
                      fontSize: 16.0);

                      showModalBottomSheet<dynamic>(
                        isScrollControlled: true,
                        context: context,
                        builder: (BuildContext bc) {
                        return CreateAcountPage();
                });
                          }else if (_emailController.text.isEmpty) {
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
              alignment: Alignment(0, -0.2),
              child: Text(
                  "---------------------------------------or---------------------------------",
                  style: TextStyle(fontSize: 10, color: Colors.grey))),
          Align(
            alignment: Alignment(0, -0.1),
            child: ElevatedButton(
              child: const Text('Sign in with Apple'),
              onPressed: null,
            ),
          ),
          Align(
            alignment: Alignment(0, 0.1),
            child: ElevatedButton(
              child: const Text('Sign in with Google'),
              onPressed: null,
            ),
          ),
          Align(
            alignment: Alignment(0, 0.3),
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
                label: Text('LOG IN TO MY ACCOUNT'),
                backgroundColor: Colors.white,
                foregroundColor: Colors.blue,
                onPressed: null,
              )),
        ]),
      ),
    );
  }
}