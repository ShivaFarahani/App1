import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

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
          child: Stack(
              children: <Widget>[
                const Align(
                    alignment: const Alignment(0, -0.3),
                    child: Text(
                        "Welcome!",
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight. bold )
                    )
                ),
                const Align(
                    alignment: const Alignment(0, -0.2),
                    child: Text(
                        "Scan your product to get started",
                        style: TextStyle(fontSize: 20)
                    )
                ),
                const Align(
                    alignment: const Alignment(0, 0),
                    child: FloatingActionButton.extended(
                      extendedPadding:
                      const EdgeInsets.only(left: 100, right: 100, top: 20, bottom: 20),
                      label: Text('SCAN'),
                      backgroundColor: Colors.blue,
                      onPressed: null,
                    )
                ),
                const Align(
                    alignment: const Alignment(0, 0.75),
                    child: Text(
                        "Already a user?",
                        style: TextStyle(fontSize: 10, color: Colors.grey)
                    )
                ),
                Align(
                    alignment: Alignment(0, 0.9),
                    child: FloatingActionButton.extended(
                      extendedPadding:
                      EdgeInsets.only(left: 100, right: 100, top: 20, bottom: 20),
                      label: Text('LOG IN TO AN EXISTING ACCOUNT'),
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.blue,
                      onPressed: () {
                        showModalBottomSheet<dynamic>(
                            isScrollControlled: true,
                            context: context,
                            builder: (BuildContext bc) {
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
                                    child: Text(
                                      "Login to your account",
                                      style: TextStyle(fontSize: 22, fontWeight: FontWeight. bold)
                                  )
                              ),
                              Align(
                              alignment: Alignment(-1, -0.65),
                              child: Text(
                                      "Email Address",
                                      style: TextStyle(fontSize: 10, color: Colors.grey )
                                  )
                              ),
                              Align(
                              alignment: Alignment(-1, -0.55),
                              child: TextField(
                                      obscureText: true,
                                      decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                  labelText: 'Email Address',
                                  hintText: 'Enter Email Address',
                                    ),
                                    )
                                  ),
                              Align(
                              alignment: Alignment(-1, -0.35),
                              child: Text(
                                      "Password",
                                      style: TextStyle(fontSize: 10, color: Colors.grey )
                                  )
                                  ),
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
                                    onPressed: null,
                                  ),
                                  ),
                                  Align(
                                      alignment: Alignment(0, 0.05),
                                      child: Text(
                                          "Forgot Password",
                                          style: TextStyle(fontSize: 15, fontWeight: FontWeight. bold, color: Colors.blue)
                                      )
                                  ),
                                  Align(
                                      alignment: Alignment(0, 0.15),
                                      child: Text(
                                          "---------------------------------------or---------------------------------",
                                          style: TextStyle(fontSize: 10, color: Colors.grey)
                                      )
                                  ),
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
                                      child: Text(
                                          "SIGN UP NOW",
                                          style: TextStyle(fontSize: 15, fontWeight: FontWeight. bold, color: Colors.blue)
                                      )
                                  ),
                                ],
                              );
                            });
                      },
                    )
                ),
              ]
          )

        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.

      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
