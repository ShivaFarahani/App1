import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:email_validator/email_validator.dart';
import 'package:sample_app/presentation/core/widgets/app_input_field.dart';
import 'package:sample_app/presentation/core/config/app_strings.dart';

import '../../../main.dart';

bool _isValid = false;


class CreateAcountPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  String pass = '';
  String confirmpass = '';

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Create your account')),
      body: Center(
          child: Stack(children: <Widget>[
            Align(
                alignment: Alignment(-1, -0.6),
                child: Text("Your Profile",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
            Align(
                alignment: Alignment(-1, -0.5),
                child: Text("First Name",
                    style: TextStyle(fontSize: 10, color: Colors.grey))),
            const Align(
              alignment: Alignment(-1, -0.4),
              child: AppInputField(
                //   obscureText: true,
                label: 'First Name',
                hint: 'Enter first name',
              ),
            ),
            Align(
                alignment: Alignment(-1, -0.25),
                child: Text("Last Name",
                    style: TextStyle(fontSize: 10, color: Colors.grey))),
            Align(
              alignment: Alignment(-1, -0.15),
              child: AppInputField(
                label: 'Last Name',
                hint: 'Enter last name',
              ),
            ),
            Align(
                alignment: Alignment(-1, 0),
                child: Text("Email Address",
                    style: TextStyle(fontSize: 10, color: Colors.grey))),
            Align(
              alignment: Alignment(-1, 0.1),
              child: TextFormField(
                //decoration: InputDecoration(labelText: 'Enter email address'),
                controller: _emailController,
              ),
            ),
            Align(
                alignment: Alignment(-1, 0.3),
                child: Text("Password",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
            Align(
                alignment: Alignment(-1, 0.4),
                child: Text("Password",
                    style: TextStyle(fontSize: 10, color: Colors.grey))),
            Align(
              alignment: Alignment(-1, 0.5),
              child: TextFormField(
                  obscureText: true,
                  //keyboardType: TextInputType.visiblePassword,
                  //decoration: InputDecoration(labelText: ''),
                  onChanged: (value) {
                    pass = value;
                  }),
            ),
            Align(
                alignment: Alignment(-1, 0.65),
                child: Text("Confirm Password",
                    style: TextStyle(fontSize: 10, color: Colors.grey))),
            Align(
              alignment: Alignment(-1, 0.75),
              child: TextFormField(
                  obscureText: true,
                  //keyboardType: TextInputType.visiblePassword,
                  //decoration: InputDecoration(labelText: ''),
                  onChanged: (value) {
                    confirmpass = value;
                  }),
            ),
            Align(
                alignment: Alignment(0, 0.95),
                child: FloatingActionButton.extended(
                  extendedPadding: const EdgeInsets.only(
                      left: 100, right: 100, top: 20, bottom: 20),
                  label: const Text(AppStrings.continueString),
                  backgroundColor: Colors.blue,
                  onPressed: () {
                    _isValid = EmailValidator.validate(_emailController.text);
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
                    if (pass.isEmpty) {
                      Fluttertoast.showToast(
                          msg: 'Enter Password',
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.TOP,
                          timeInSecForIosWeb: 1,
                          fontSize: 16.0);
                    } else if (confirmpass.isEmpty) {
                      Fluttertoast.showToast(
                          msg: 'Confirm Password',
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.TOP,
                          timeInSecForIosWeb: 1,
                          fontSize: 16.0);
                    } else if (confirmpass != pass) {
                      Fluttertoast.showToast(
                          msg: 'Confirmed Password does not match',
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.TOP,
                          timeInSecForIosWeb: 1,
                          fontSize: 16.0);
                    }
                  },
                )),
          ])),
    );
  }
}