import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sample_app/presentation/auth/login_page.dart';
import 'package:sample_app/presentation/auth/signup_page.dart';
import 'package:sample_app/presentation/core/config/app_colors.dart';
import 'package:sample_app/presentation/core/config/app_strings.dart';
import 'package:sample_app/presentation/core/widgets/app_input_field.dart';

void main() {
  runApp(const MyApp());
}

final _emailController = TextEditingController();
bool _isValid = false;

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        //title: Text('Welcome!')
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        //title: Text(widget.title),
      ),
      body: Center(
          child: Stack(children: <Widget>[
            const Align(
                alignment: const Alignment(0, -0.3),
                child: Text("Welcome!",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
            const Align(
                alignment: const Alignment(0, -0.2),
                child: Text("Scan your product to get started",
                    style: TextStyle(fontSize: 20))),
            const Align(
                alignment: const Alignment(0, 0),
                child: FloatingActionButton.extended(
                  extendedPadding: const EdgeInsets.only(
                      left: 100, right: 100, top: 20, bottom: 20),
                  label: Text('SCAN'),
                  backgroundColor: AppColors.blue,
                  onPressed: null,
                )),
            const Align(
                alignment: const Alignment(0, 0.75),
                child: Text("Already a user?",
                    style: TextStyle(fontSize: 10, color: Colors.grey))),
            Align(
                alignment: Alignment(0, 0.9),
                child: FloatingActionButton.extended(
                  extendedPadding:
                  EdgeInsets.only(left: 100, right: 100, top: 20, bottom: 20),
                  label: Text('LOG IN TO AN EXISTING ACCOUNT'),
                  backgroundColor: Colors.white,
                  foregroundColor: AppColors.blue,
                  onPressed: () {
                    showModalBottomSheet<dynamic>(
                        isScrollControlled: true,
                        context: context,
                        builder: (BuildContext bc) {
                          return LoginBottomSheet();
                        });
                  },
                )),
          ])

        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.

      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}




